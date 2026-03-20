const pool = require('../db/pool')
const { clearPersonsCache } = require('./aiController')

const OLLAMA_HOST  = process.env.OLLAMA_HOST  || 'http://host.docker.internal:11434'
const OLLAMA_MODEL = process.env.OLLAMA_MODEL || 'qwen2.5:14b'

const PROVIDERS = {
  hackbook: { platform: 'facebook', label: 'Hackbook' },
  hackx:    { platform: 'twitter',  label: 'HackX'    },
  hackgle:  { platform: 'youtube',  label: 'Hackgle'  },
}

const DANISH_CITIES = [
  'Copenhagen', 'Aarhus', 'Odense', 'Aalborg',
  'Esbjerg', 'Randers', 'Kolding', 'Horsens', 'Vejle', 'Roskilde',
]

async function generateAndLogin(req, res, next) {
  const { provider } = req.body
  if (!provider || !PROVIDERS[provider]) {
    return res.status(400).json({ error: 'Invalid provider. Use: hackbook, hackx, hackgle' })
  }

  const { platform, label } = PROVIDERS[provider]
  const city = DANISH_CITIES[Math.floor(Math.random() * DANISH_CITIES.length)]

  const systemPrompt = `You generate fictional archived person profiles for a digital archive. Return ONLY valid JSON, no markdown, no extra text.`

  const userPrompt = `Generate a realistic fictional person living in ${city}, Denmark who uses ${label} (a social network). Return exactly this JSON:
{
  "full_name": "First Last",
  "birth_year": 1990,
  "gender": "female",
  "username": "social_username",
  "display_name": "Display Name",
  "bio": "Short 1-2 sentence bio.",
  "post": "A short mundane personal social media post, 1-3 sentences, no hashtags."
}
Rules:
- full_name: realistic first and last name. Can be Danish, Scandinavian, or international (any background).
- birth_year: integer between 1970 and 2003.
- gender: exactly "male", "female", or "non-binary".
- username: lowercase, dots or underscores allowed, no spaces.
- bio: casual tone, sounds like a real person.
- post: very ordinary and personal. Something a real person would post. No hashtags.`

  try {
    const ollamaRes = await fetch(`${OLLAMA_HOST}/api/chat`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        model: OLLAMA_MODEL,
        stream: false,
        messages: [
          { role: 'system', content: systemPrompt },
          { role: 'user',   content: userPrompt   },
        ],
        options: { temperature: 0.85, num_ctx: 4096 },
      }),
    })

    if (!ollamaRes.ok) {
      const text = await ollamaRes.text()
      throw new Error(`Ollama error ${ollamaRes.status}: ${text}`)
    }

    const ollamaData = await ollamaRes.json()
    const rawContent = ollamaData?.message?.content || ''
    const jsonMatch  = rawContent.match(/\{[\s\S]*\}/)
    if (!jsonMatch) throw new Error('Model did not return valid JSON')

    const g = JSON.parse(jsonMatch[0])

    const fullName    = String(g.full_name    || 'Unknown Person').trim()
    const birthYear   = parseInt(g.birth_year) || 1990
    const gender      = ['male', 'female', 'non-binary'].includes(g.gender) ? g.gender : 'male'
    const username    = String(g.username     || fullName.toLowerCase().replace(/\s+/g, '_')).trim()
    const displayName = String(g.display_name || fullName).trim()
    const bio         = String(g.bio          || '').trim()
    const postContent = String(g.post         || '').trim()
    const birthDate   = `${Math.max(1970, Math.min(2003, birthYear))}-06-15`

    // Insert person
    const personRes = await pool.query(
      `INSERT INTO persons (full_name, birth_date, location, digital_status, archived_at, gender, notes)
       VALUES ($1, $2, $3, 'active', NOW(), $4, $5)
       RETURNING *`,
      [fullName, birthDate, `${city}, Denmark`, gender, bio || null]
    )
    const person = personRes.rows[0]

    // Get platform id
    const plRes = await pool.query('SELECT id FROM platforms WHERE name = $1', [platform])
    if (plRes.rows.length === 0) throw new Error(`Platform not found: ${platform}`)
    const platformId = plRes.rows[0].id

    // Insert platform profile
    const profileRes = await pool.query(
      `INSERT INTO platform_profiles (person_id, platform_id, username, display_name, bio, is_active, scraped_at)
       VALUES ($1, $2, $3, $4, $5, TRUE, NOW())
       RETURNING id`,
      [person.id, platformId, username, displayName, bio || null]
    )
    const profileId = profileRes.rows[0].id

    // Insert one AI-generated post
    if (postContent) {
      await pool.query(
        `INSERT INTO posts (profile_id, content, post_type, posted_at, archived_at)
         VALUES ($1, $2, 'post', NOW(), NOW())`,
        [profileId, postContent]
      )
    }

    clearPersonsCache()

    res.json({ id: person.id, full_name: person.full_name, platform, location: `${city}, Denmark` })
  } catch (err) {
    next(err)
  }
}

async function deleteAccount(req, res, next) {
  const { personId } = req.body
  if (!personId) return res.status(400).json({ error: 'personId required' })
  try {
    await pool.query('DELETE FROM persons WHERE id = $1', [personId])
    clearPersonsCache()
    res.json({ deleted: true })
  } catch (err) {
    next(err)
  }
}

module.exports = { generateAndLogin, deleteAccount }
