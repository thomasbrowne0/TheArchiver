const pool = require('../db/pool')

async function listPersons(req, res, next) {
  try {
    const result = await pool.query(`
      SELECT
        p.*,
        COUNT(pp.id)::int AS platform_count
      FROM persons p
      LEFT JOIN platform_profiles pp ON pp.person_id = p.id
      GROUP BY p.id
      ORDER BY p.archived_at DESC
    `)
    res.json(result.rows)
  } catch (err) {
    next(err)
  }
}

async function getPerson(req, res, next) {
  const { id } = req.params
  try {
    const result = await pool.query(`
      SELECT
        p.*,
        COALESCE(
          json_agg(
            json_build_object(
              'id',              pp.id,
              'platform_name',   pl.name,
              'platform_label',  pl.label,
              'platform_color',  pl.color,
              'platform_icon',   pl.icon,
              'username',        pp.username,
              'display_name',    pp.display_name,
              'bio',             pp.bio,
              'avatar_url',      pp.avatar_url,
              'follower_count',  pp.follower_count,
              'following_count', pp.following_count,
              'post_count',      pp.post_count,
              'profile_url',     pp.profile_url,
              'is_active',       pp.is_active,
              'last_seen_at',    pp.last_seen_at
            ) ORDER BY pl.name
          ) FILTER (WHERE pp.id IS NOT NULL),
          '[]'
        ) AS profiles
      FROM persons p
      LEFT JOIN platform_profiles pp ON pp.person_id = p.id
      LEFT JOIN platforms pl ON pl.id = pp.platform_id
      WHERE p.id = $1
      GROUP BY p.id
    `, [id])

    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Person not found', code: 404 })
    }
    res.json(result.rows[0])
  } catch (err) {
    next(err)
  }
}

async function getPersonPosts(req, res, next) {
  const { id } = req.params
  const { platform } = req.query
  try {
    const params = [id]
    let platformFilter = ''
    if (platform) {
      params.push(platform)
      platformFilter = `AND pl.name = $${params.length}`
    }

    const result = await pool.query(`
      SELECT
        po.id        AS post_id,
        pl.label     AS platform_label,
        pl.color     AS platform_color,
        pl.name      AS platform_name,
        pl.icon      AS platform_icon,
        pp.username,
        po.content,
        po.image_url,
        po.likes_count,
        po.comments_count,
        po.posted_at,
        po.post_type
      FROM posts po
      JOIN platform_profiles pp ON pp.id = po.profile_id
      JOIN platforms pl ON pl.id = pp.platform_id
      WHERE pp.person_id = $1
      ${platformFilter}
      ORDER BY po.posted_at DESC
    `, params)

    res.json(result.rows)
  } catch (err) {
    next(err)
  }
}

module.exports = { listPersons, getPerson, getPersonPosts }
