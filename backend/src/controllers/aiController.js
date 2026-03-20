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
        p.gender, p.last_active, p.personal_url,
        COUNT(pp.id)::int AS platform_count,
        COALESCE(
          array_agg(pl.name ORDER BY pl.name) FILTER (WHERE pl.name IS NOT NULL),
          '{}'
        ) AS platform_names
      FROM persons p
      LEFT JOIN platform_profiles pp ON pp.person_id = p.id
      LEFT JOIN platforms pl ON pl.id = pp.platform_id
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
        p.gender ? `  Gender: ${p.gender}` : null,
        p.location ? `  Location: ${p.location}` : null,
        p.birth_date ? `  Born: ${new Date(p.birth_date).getFullYear()}` : null,
        p.is_deceased && p.death_date ? `  Died: ${new Date(p.death_date).getFullYear()}` : null,
        `  Platforms: ${p.platform_names.length > 0 ? p.platform_names.join(', ') : 'none'} (count: ${p.platform_count})`,
        p.last_active ? `  Last active: ${p.last_active.toISOString().slice(0, 10)}` : null,
        p.personal_url ? `  Personal URL: ${p.personal_url}` : null,
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
  "filter_status_exclude": [],
  "filter_terms": [],
  "filter_name_starts_with": "",
  "filter_name_contains": "",
  "filter_gender": "",
  "filter_location": "",
  "no_platforms": false,
  "has_platforms": [],
  "only_these_platforms": false,
  "filter_min_platforms": null,
  "filter_max_platforms": null,
  "filter_last_active_after": "",
  "filter_last_active_before": "",
  "filter_archived_after": "",
  "filter_archived_before": "",
  "filter_has_personal_url": null,
  "sort_by": null,
  "sort_dir": "asc",
  "limit": null,
  "random": false
}

Field rules:
- "answer": plain string only, never a nested object.
- "filter_statuses": array of zero or more of "active", "absent", "deceased". OR logic. Empty = no filter.
- "filter_status_exclude": array of statuses to EXCLUDE. Use for negation ("everyone except active"). OR logic with filter_statuses.
- "filter_terms": array of person name strings to match (partial OK). OR logic. Empty = no filter.
- "filter_name_starts_with": single letter — show people whose full name starts with this letter. Empty = no filter.
- "filter_name_contains": substring to find anywhere in the full name. Empty = no filter. Use for mid-name searches.
- "filter_gender": "" | "male" | "female" | "non-binary". Empty = no filter.
- "filter_location": string to match against location field. Empty = no filter.
- "no_platforms": true only if user asks for people with zero social media.
- "has_platforms": array of platform slugs the person must have. Valid slugs: instagram, facebook, twitter, reddit, snapchat, linkedin, youtube, tiktok, pinterest. AND logic.
- "only_these_platforms": true if user wants people with ONLY those platforms and nothing else.
- "filter_min_platforms": null OR integer — person must have at least this many platforms.
- "filter_max_platforms": null OR integer — person must have at most this many platforms.
- "filter_last_active_after": ISO date string (YYYY-MM-DD) — only people last active on or after this date. Empty = no filter.
- "filter_last_active_before": ISO date string — only people last active on or before this date. Empty = no filter.
- "filter_archived_after": ISO date string — only people archived on or after this date. Empty = no filter.
- "filter_archived_before": ISO date string — only people archived before this date. Empty = no filter.
- "filter_has_personal_url": null = no filter, true = must have a personal URL, false = must NOT have a personal URL.
- "sort_by": null OR one of "name", "birth_date", "archived_at", "platform_count", "last_active".
- "sort_dir": "asc" or "desc".
- "limit": null OR a positive integer — how many results to show.
- "random": true if user wants a random selection (shuffle before applying limit).

LOOKUP TABLE — use these exact patterns as templates. Match the user's intent to the closest example and follow the same JSON structure.

---
EXAMPLE 1 — names starting with a letter
User: "show me everyone whose name starts with A"
{"answer":"Showing all archived persons whose name begins with A.","filter_statuses":[],"filter_terms":[],"filter_name_starts_with":"A","filter_location":"","no_platforms":false,"has_platforms":[],"only_these_platforms":false,"sort_by":null,"sort_dir":"asc","limit":null,"random":false}

---
EXAMPLE 2 — single platform, inclusive (person has it among others)
User: "show people who have Facebook"
{"answer":"Showing all archived persons with a Facebook presence.","filter_statuses":[],"filter_terms":[],"filter_name_starts_with":"","filter_location":"","no_platforms":false,"has_platforms":["facebook"],"only_these_platforms":false,"sort_by":null,"sort_dir":"asc","limit":null,"random":false}

---
EXAMPLE 3 — single platform, exclusive (person has ONLY that platform)
User: "show people with only Facebook"
{"answer":"Showing persons whose only archived platform is Facebook.","filter_statuses":[],"filter_terms":[],"filter_name_starts_with":"","filter_location":"","no_platforms":false,"has_platforms":["facebook"],"only_these_platforms":true,"sort_by":null,"sort_dir":"asc","limit":null,"random":false}

---
EXAMPLE 4 — multiple platforms, exclusive
User: "who has only Facebook and Reddit"
{"answer":"Showing persons archived with only Facebook and Reddit and no other platforms.","filter_statuses":[],"filter_terms":[],"filter_name_starts_with":"","filter_location":"","no_platforms":false,"has_platforms":["facebook","reddit"],"only_these_platforms":true,"sort_by":null,"sort_dir":"asc","limit":null,"random":false}

---
EXAMPLE 5 — multiple platforms, inclusive
User: "people who are on both Instagram and TikTok"
{"answer":"Showing persons who have both Instagram and TikTok archived.","filter_statuses":[],"filter_terms":[],"filter_name_starts_with":"","filter_location":"","no_platforms":false,"has_platforms":["instagram","tiktok"],"only_these_platforms":false,"sort_by":null,"sort_dir":"asc","limit":null,"random":false}

---
EXAMPLE 6 — status filter, single
User: "show all absent users"
{"answer":"Showing all persons with an absent digital status — accounts exist but have gone silent.","filter_statuses":["absent"],"filter_terms":[],"filter_name_starts_with":"","filter_location":"","no_platforms":false,"has_platforms":[],"only_these_platforms":false,"sort_by":null,"sort_dir":"asc","limit":null,"random":false}

---
EXAMPLE 7 — status filter, multiple
User: "show active and absent people"
{"answer":"Showing all active and absent persons in the archive.","filter_statuses":["active","absent"],"filter_terms":[],"filter_name_starts_with":"","filter_location":"","no_platforms":false,"has_platforms":[],"only_these_platforms":false,"sort_by":null,"sort_dir":"asc","limit":null,"random":false}

---
EXAMPLE 8 — location filter
User: "find people from Germany"
{"answer":"Showing all archived persons located in Germany.","filter_statuses":[],"filter_terms":[],"filter_name_starts_with":"","filter_location":"Germany","no_platforms":false,"has_platforms":[],"only_these_platforms":false,"sort_by":null,"sort_dir":"asc","limit":null,"random":false}

---
EXAMPLE 9 — multi-name search
User: "find Marcus and Priya"
{"answer":"Showing records for Marcus and Priya.","filter_statuses":[],"filter_terms":["Marcus","Priya"],"filter_name_starts_with":"","filter_location":"","no_platforms":false,"has_platforms":[],"only_these_platforms":false,"sort_by":null,"sort_dir":"asc","limit":null,"random":false}

---
EXAMPLE 10 — no platforms
User: "who has no social media presence"
{"answer":"Showing persons with no platforms archived.","filter_statuses":[],"filter_terms":[],"filter_name_starts_with":"","filter_location":"","no_platforms":true,"has_platforms":[],"only_these_platforms":false,"sort_by":null,"sort_dir":"asc","limit":null,"random":false}

---
EXAMPLE 11 — sort by recency
User: "who was archived most recently"
{"answer":"Showing the most recently archived person.","filter_statuses":[],"filter_terms":[],"filter_name_starts_with":"","filter_location":"","no_platforms":false,"has_platforms":[],"only_these_platforms":false,"sort_by":"archived_at","sort_dir":"desc","limit":1,"random":false}

---
EXAMPLE 12 — sort by platform count
User: "who has the most platforms"
{"answer":"Showing the person with the most archived platforms.","filter_statuses":[],"filter_terms":[],"filter_name_starts_with":"","filter_location":"","no_platforms":false,"has_platforms":[],"only_these_platforms":false,"sort_by":"platform_count","sort_dir":"desc","limit":1,"random":false}

---
EXAMPLE 13 — random with limit
User: "show me 3 random records"
{"answer":"Showing 3 randomly selected archived persons.","filter_statuses":[],"filter_terms":[],"filter_name_starts_with":"","filter_location":"","no_platforms":false,"has_platforms":[],"only_these_platforms":false,"sort_by":null,"sort_dir":"asc","limit":3,"random":true}

---
EXAMPLE 14 — random with status + limit
User: "give me 2 random active users"
{"answer":"Showing 2 randomly selected active persons.","filter_statuses":["active"],"filter_terms":[],"filter_name_starts_with":"","filter_location":"","no_platforms":false,"has_platforms":[],"only_these_platforms":false,"sort_by":null,"sort_dir":"asc","limit":2,"random":true}

---
EXAMPLE 15 — combined: status + platform
User: "active users who have LinkedIn"
{"answer":"Showing active persons with a LinkedIn presence archived.","filter_statuses":["active"],"filter_terms":[],"filter_name_starts_with":"","filter_location":"","no_platforms":false,"has_platforms":["linkedin"],"only_these_platforms":false,"sort_by":null,"sort_dir":"asc","limit":null,"random":false}

---
EXAMPLE 16 — combined: location + status
User: "absent people from the UK"
{"answer":"Showing absent persons located in the UK.","filter_statuses":["absent"],"filter_terms":[],"filter_name_starts_with":"","filter_location":"UK","no_platforms":false,"has_platforms":[],"only_these_platforms":false,"sort_by":null,"sort_dir":"asc","limit":null,"random":false}

---
EXAMPLE 17 — sort oldest first
User: "show the oldest people in the archive"
{"answer":"Showing persons sorted oldest to youngest by birth date.","filter_statuses":[],"filter_status_exclude":[],"filter_terms":[],"filter_name_starts_with":"","filter_name_contains":"","filter_gender":"","filter_location":"","no_platforms":false,"has_platforms":[],"only_these_platforms":false,"filter_min_platforms":null,"filter_max_platforms":null,"filter_last_active_after":"","filter_last_active_before":"","filter_archived_after":"","filter_archived_before":"","filter_has_personal_url":null,"sort_by":"birth_date","sort_dir":"asc","limit":null,"random":false}

---
EXAMPLE 18 — gender filter
User: "show all women in the archive"
{"answer":"Showing all female persons in the archive.","filter_statuses":[],"filter_status_exclude":[],"filter_terms":[],"filter_name_starts_with":"","filter_name_contains":"","filter_gender":"female","filter_location":"","no_platforms":false,"has_platforms":[],"only_these_platforms":false,"filter_min_platforms":null,"filter_max_platforms":null,"filter_last_active_after":"","filter_last_active_before":"","filter_archived_after":"","filter_archived_before":"","filter_has_personal_url":null,"sort_by":null,"sort_dir":"asc","limit":null,"random":false}

---
EXAMPLE 19 — min platform count
User: "people with more than 3 platforms"
{"answer":"Showing persons with more than 3 platforms archived.","filter_statuses":[],"filter_status_exclude":[],"filter_terms":[],"filter_name_starts_with":"","filter_name_contains":"","filter_gender":"","filter_location":"","no_platforms":false,"has_platforms":[],"only_these_platforms":false,"filter_min_platforms":4,"filter_max_platforms":null,"filter_last_active_after":"","filter_last_active_before":"","filter_archived_after":"","filter_archived_before":"","filter_has_personal_url":null,"sort_by":null,"sort_dir":"asc","limit":null,"random":false}

---
EXAMPLE 20 — negation / status exclusion
User: "everyone except active users"
{"answer":"Showing all persons who are not active — absent and deceased records.","filter_statuses":[],"filter_status_exclude":["active"],"filter_terms":[],"filter_name_starts_with":"","filter_name_contains":"","filter_gender":"","filter_location":"","no_platforms":false,"has_platforms":[],"only_these_platforms":false,"filter_min_platforms":null,"filter_max_platforms":null,"filter_last_active_after":"","filter_last_active_before":"","filter_archived_after":"","filter_archived_before":"","filter_has_personal_url":null,"sort_by":null,"sort_dir":"asc","limit":null,"random":false}

---
EXAMPLE 21 — has personal URL
User: "who has a personal website"
{"answer":"Showing persons with a personal website or URL on file.","filter_statuses":[],"filter_status_exclude":[],"filter_terms":[],"filter_name_starts_with":"","filter_name_contains":"","filter_gender":"","filter_location":"","no_platforms":false,"has_platforms":[],"only_these_platforms":false,"filter_min_platforms":null,"filter_max_platforms":null,"filter_last_active_after":"","filter_last_active_before":"","filter_archived_after":"","filter_archived_before":"","filter_has_personal_url":true,"sort_by":null,"sort_dir":"asc","limit":null,"random":false}

---
EXAMPLE 22 — name contains substring
User: "find everyone with 'ova' in their name"
{"answer":"Showing persons whose name contains 'ova'.","filter_statuses":[],"filter_status_exclude":[],"filter_terms":[],"filter_name_starts_with":"","filter_name_contains":"ova","filter_gender":"","filter_location":"","no_platforms":false,"has_platforms":[],"only_these_platforms":false,"filter_min_platforms":null,"filter_max_platforms":null,"filter_last_active_after":"","filter_last_active_before":"","filter_archived_after":"","filter_archived_before":"","filter_has_personal_url":null,"sort_by":null,"sort_dir":"asc","limit":null,"random":false}

---
EXAMPLE 23 — last active filter
User: "who was last active after October 2024"
{"answer":"Showing persons whose last recorded activity was after October 2024.","filter_statuses":[],"filter_status_exclude":[],"filter_terms":[],"filter_name_starts_with":"","filter_name_contains":"","filter_gender":"","filter_location":"","no_platforms":false,"has_platforms":[],"only_these_platforms":false,"filter_min_platforms":null,"filter_max_platforms":null,"filter_last_active_after":"2024-10-01","filter_last_active_before":"","filter_archived_after":"","filter_archived_before":"","filter_has_personal_url":null,"sort_by":"last_active","sort_dir":"desc","limit":null,"random":false}

---
EXAMPLE 24 — archived before date
User: "people added to the archive before 2024"
{"answer":"Showing persons who were archived before 2024.","filter_statuses":[],"filter_status_exclude":[],"filter_terms":[],"filter_name_starts_with":"","filter_name_contains":"","filter_gender":"","filter_location":"","no_platforms":false,"has_platforms":[],"only_these_platforms":false,"filter_min_platforms":null,"filter_max_platforms":null,"filter_last_active_after":"","filter_last_active_before":"","filter_archived_after":"","filter_archived_before":"2024-01-01","filter_has_personal_url":null,"sort_by":null,"sort_dir":"asc","limit":null,"random":false}

---
EXAMPLE 25 — compound: gender + platform + location
User: "women from Italy with Instagram"
{"answer":"Showing female persons from Italy with an Instagram presence.","filter_statuses":[],"filter_status_exclude":[],"filter_terms":[],"filter_name_starts_with":"","filter_name_contains":"","filter_gender":"female","filter_location":"Italy","no_platforms":false,"has_platforms":["instagram"],"only_these_platforms":false,"filter_min_platforms":null,"filter_max_platforms":null,"filter_last_active_after":"","filter_last_active_before":"","filter_archived_after":"","filter_archived_before":"","filter_has_personal_url":null,"sort_by":null,"sort_dir":"asc","limit":null,"random":false}

---
EXAMPLE 26 — sort by last active
User: "who was most recently active"
{"answer":"Showing persons sorted by most recent activity.","filter_statuses":[],"filter_status_exclude":[],"filter_terms":[],"filter_name_starts_with":"","filter_name_contains":"","filter_gender":"","filter_location":"","no_platforms":false,"has_platforms":[],"only_these_platforms":false,"filter_min_platforms":null,"filter_max_platforms":null,"filter_last_active_after":"","filter_last_active_before":"","filter_archived_after":"","filter_archived_before":"","filter_has_personal_url":null,"sort_by":"last_active","sort_dir":"desc","limit":null,"random":false}

---
Now answer the user's question using the same JSON structure as the examples above.`

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
        options: { temperature: 0.1, num_ctx: 16384 }
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

    const validStatuses  = new Set(['active', 'absent', 'deceased'])
    const validGenders   = new Set(['male', 'female', 'non-binary'])
    const validSortBy    = new Set(['name', 'birth_date', 'archived_at', 'platform_count', 'last_active'])
    const validPlatforms = new Set(['instagram','facebook','twitter','reddit','snapchat','linkedin','youtube','tiktok','pinterest'])

    const nameStartsWith = typeof p.filter_name_starts_with === 'string'
      ? p.filter_name_starts_with.trim().slice(0, 1).toUpperCase()
      : ''

    const toDateStr = v => (typeof v === 'string' && /^\d{4}-\d{2}-\d{2}/.test(v)) ? v.slice(0, 10) : ''

    res.json({
      answer,
      filter: {
        statuses:              Array.isArray(p.filter_statuses)      ? p.filter_statuses.filter(s => validStatuses.has(s))       : [],
        status_exclude:        Array.isArray(p.filter_status_exclude) ? p.filter_status_exclude.filter(s => validStatuses.has(s)) : [],
        terms:                 Array.isArray(p.filter_terms)          ? p.filter_terms.filter(t => typeof t === 'string' && t.trim()) : [],
        name_starts_with:      nameStartsWith,
        name_contains:         typeof p.filter_name_contains === 'string' ? p.filter_name_contains.trim() : '',
        gender:                validGenders.has(p.filter_gender) ? p.filter_gender : '',
        location:              typeof p.filter_location === 'string' ? p.filter_location : '',
        no_platforms:          p.no_platforms === true,
        has_platforms:         Array.isArray(p.has_platforms) ? p.has_platforms.filter(pl => validPlatforms.has(pl)) : [],
        only_these_platforms:  p.only_these_platforms === true,
        min_platforms:         Number.isInteger(p.filter_min_platforms) && p.filter_min_platforms > 0 ? p.filter_min_platforms : null,
        max_platforms:         Number.isInteger(p.filter_max_platforms) && p.filter_max_platforms >= 0 ? p.filter_max_platforms : null,
        last_active_after:     toDateStr(p.filter_last_active_after),
        last_active_before:    toDateStr(p.filter_last_active_before),
        archived_after:        toDateStr(p.filter_archived_after),
        archived_before:       toDateStr(p.filter_archived_before),
        has_personal_url:      p.filter_has_personal_url === true ? true : p.filter_has_personal_url === false ? false : null,
        sort_by:               validSortBy.has(p.sort_by) ? p.sort_by : null,
        sort_dir:              p.sort_dir === 'desc' ? 'desc' : 'asc',
        limit:                 Number.isInteger(p.limit) && p.limit > 0 ? p.limit : null,
        random:                p.random === true,
      }
    })
  } catch (err) {
    next(err)
  }
}

module.exports = { aiQuery }
