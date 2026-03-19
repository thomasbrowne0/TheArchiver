const pool = require('../db/pool')

async function listPlatforms(req, res, next) {
  try {
    const result = await pool.query('SELECT * FROM platforms ORDER BY name')
    res.json(result.rows)
  } catch (err) {
    next(err)
  }
}

module.exports = { listPlatforms }
