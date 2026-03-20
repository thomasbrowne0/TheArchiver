const pool = require('../db/pool')

async function listCompanies(req, res, next) {
  try {
    const result = await pool.query(`
      SELECT
        c.*,
        COUNT(cpp.id)::int AS platform_count,
        COALESCE(
          json_agg(
            json_build_object(
              'id',             cpp.id,
              'platform_name',  pl.name,
              'platform_label', pl.label,
              'platform_color', pl.color,
              'platform_icon',  pl.icon,
              'username',       cpp.username,
              'display_name',   cpp.display_name,
              'is_active',      cpp.is_active
            ) ORDER BY pl.name
          ) FILTER (WHERE cpp.id IS NOT NULL),
          '[]'
        ) AS profiles
      FROM companies c
      LEFT JOIN company_platform_profiles cpp ON cpp.company_id = c.id
      LEFT JOIN platforms pl ON pl.id = cpp.platform_id
      GROUP BY c.id
      ORDER BY c.archived_at DESC
    `)
    res.json(result.rows)
  } catch (err) {
    next(err)
  }
}

async function getCompany(req, res, next) {
  const { id } = req.params
  try {
    const result = await pool.query(`
      SELECT
        c.*,
        COALESCE(
          json_agg(
            json_build_object(
              'id',              cpp.id,
              'platform_name',   pl.name,
              'platform_label',  pl.label,
              'platform_color',  pl.color,
              'platform_icon',   pl.icon,
              'username',        cpp.username,
              'display_name',    cpp.display_name,
              'bio',             cpp.bio,
              'avatar_url',      cpp.avatar_url,
              'follower_count',  cpp.follower_count,
              'following_count', cpp.following_count,
              'post_count',      cpp.post_count,
              'profile_url',     cpp.profile_url,
              'is_active',       cpp.is_active,
              'last_seen_at',    cpp.last_seen_at
            ) ORDER BY pl.name
          ) FILTER (WHERE cpp.id IS NOT NULL),
          '[]'
        ) AS profiles
      FROM companies c
      LEFT JOIN company_platform_profiles cpp ON cpp.company_id = c.id
      LEFT JOIN platforms pl ON pl.id = cpp.platform_id
      WHERE c.id = $1
      GROUP BY c.id
    `, [id])

    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Company not found', code: 404 })
    }
    res.json(result.rows[0])
  } catch (err) {
    next(err)
  }
}

module.exports = { listCompanies, getCompany }
