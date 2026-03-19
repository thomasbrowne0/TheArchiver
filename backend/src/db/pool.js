const { Pool } = require('pg')

const pool = new Pool({
  host:     process.env.POSTGRES_HOST     || 'localhost',
  port:     parseInt(process.env.POSTGRES_PORT || '5432'),
  user:     process.env.POSTGRES_USER     || 'archiver',
  password: process.env.POSTGRES_PASSWORD || 'archiver_secret',
  database: process.env.POSTGRES_DB       || 'archiver_db',
})

module.exports = pool
