const pool = require('../db/pool')

const OLLAMA_HOST  = process.env.OLLAMA_HOST  || 'http://host.docker.internal:11434'
const OLLAMA_MODEL = process.env.OLLAMA_MODEL || 'llama3.2'

async function aiQuery(req, res, next) {
  const { question } = req.body
  if (!question || typeof question !== 'string' || !question.trim()) {
    return res.status(400).json({ error: 'Question is required' })
  }

  try {
    const result = await pool.query(`
      SELECT
        p.id, p.full_name, p.birth_date, p.is_deceased, p.death_date,
        p.location, p.digital_status, p.archived_at, p.notes,
        COUNT(pp.id)::int AS platform_count
      FROM persons p
      LEFT JOIN platform_profiles pp ON pp.person_id = p.id
      GROUP BY p.id
      ORDER BY p.archived_at DESC
    `)

    const persons = result.rows
    const statusCounts = {
      active:   persons.filter(p => p.digital_status === 'active').length,
      absent:   persons.filter(p => p.digital_status === 'absent').length,
      deceased: persons.filter(p => p.digital_status === 'deceased').length,
    }

    const personSummaries = persons.map(p => {
      const parts = [
        `- ${p.full_name} (${p.digital_status.toUpperCase()})`,
        p.location ? `  Location: ${p.location}` : null,
        p.birth_date ? `  Born: ${new Date(p.birth_date).getFullYear()}` : null,
        p.is_deceased && p.death_date ? `  Died: ${new Date(p.death_date).getFullYear()}` : null,
        `  Platforms archived: ${p.platform_count}`,
        p.notes ? `  Notes: ${p.notes}` : null,
      ].filter(Boolean)
      return parts.join('\n')
    }).join('\n\n')

    const systemPrompt = `You are an AI assistant for "The Archiver" — a digital footprint archive.

The archive contains ${persons.length} records:
- ${statusCounts.active} ACTIVE (regular online presence)
- ${statusCounts.absent} ABSENT (accounts exist but gone silent)
- ${statusCounts.deceased} DECEASED (person has died)

ARCHIVED PERSONS:
${personSummaries}

Answer the user's question. Respond with ONLY a valid JSON object — no markdown fences, no explanation outside the JSON.

JSON format:
{
  "answer": "Plain string answer to the question. Include counts or names when relevant.",
  "filter_statuses": [],
  "filter_terms": [],
  "filter_location": "",
  "no_platforms": false,
  "sort_by": null,
  "sort_dir": "asc",
  "limit": null,
  "random": false
}

Field rules:
- "answer": plain string only, never a nested object.
- "filter_statuses": array of zero or more of "active", "absent", "deceased". OR logic. Empty = no filter.
- "filter_terms": array of person name strings to match (partial OK). OR logic. Empty = no filter.
- "filter_location": string to match against location field. Empty string = no filter.
- "no_platforms": true only if user asks for people with zero social media / no platforms archived.
- "sort_by": null OR one of "name", "birth_date", "archived_at", "platform_count".
- "sort_dir": "asc" or "desc".
- "limit": null OR a positive integer — how many results to show.
- "random": true if user wants a random selection (shuffle before applying limit).

Examples:
- "show me 2 random active users" → filter_statuses:["active"], random:true, limit:2
- "who was archived most recently" → sort_by:"archived_at", sort_dir:"desc", limit:1
- "show oldest people first" → sort_by:"birth_date", sort_dir:"asc"
- "who has the most platforms" → sort_by:"platform_count", sort_dir:"desc", limit:1
- "find people from London" → filter_location:"London"
- "who has no social media" → no_platforms:true
- "show me 3 random records" → random:true, limit:3
- "find Marcus and Jane" → filter_terms:["Marcus","Jane"]
- "show active and absent" → filter_statuses:["active","absent"]`

    const ollamaRes = await fetch(`${OLLAMA_HOST}/api/chat`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        model: OLLAMA_MODEL,
        stream: false,
        messages: [
          { role: 'system', content: systemPrompt },
          { role: 'user',   content: question.trim() },
        ],
        options: { temperature: 0.1 }
      })
    })

    if (!ollamaRes.ok) {
      const text = await ollamaRes.text()
      throw new Error(`Ollama error ${ollamaRes.status}: ${text}`)
    }

    const ollamaData = await ollamaRes.json()
    const rawContent = ollamaData?.message?.content || ''

    const jsonMatch = rawContent.match(/\{[\s\S]*\}/)
    if (!jsonMatch) throw new Error('Model did not return valid JSON')

    const p = JSON.parse(jsonMatch[0])

    // Sanitise answer
    let answer = p.answer
    if (typeof answer !== 'string') {
      answer = typeof answer === 'object' ? JSON.stringify(answer) : String(answer ?? '')
    }
    if (!answer.trim()) answer = 'No answer returned.'

    const validStatuses = new Set(['active', 'absent', 'deceased'])
    const validSortBy   = new Set(['name', 'birth_date', 'archived_at', 'platform_count'])

    res.json({
      answer,
      filter: {
        statuses:     Array.isArray(p.filter_statuses) ? p.filter_statuses.filter(s => validStatuses.has(s)) : [],
        terms:        Array.isArray(p.filter_terms)    ? p.filter_terms.filter(t => typeof t === 'string' && t.trim()) : [],
        location:     typeof p.filter_location === 'string' ? p.filter_location : '',
        no_platforms: p.no_platforms === true,
        sort_by:      validSortBy.has(p.sort_by) ? p.sort_by : null,
        sort_dir:     p.sort_dir === 'desc' ? 'desc' : 'asc',
        limit:        Number.isInteger(p.limit) && p.limit > 0 ? p.limit : null,
        random:       p.random === true,
      }
    })
  } catch (err) {
    next(err)
  }
}

module.exports = { aiQuery }
