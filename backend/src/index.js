require('dotenv').config()
const express = require('express')
const cors    = require('cors')

const personsRoutes   = require('./routes/persons')
const platformsRoutes = require('./routes/platforms')
const aiRoutes        = require('./routes/ai')
const companiesRoutes = require('./routes/companies')
const authRoutes      = require('./routes/auth')

const app  = express()
const PORT = process.env.PORT || 4000
const APP_HOST = process.env.VITE_APP_HOST || process.env.VITE_API_HOST || 'localhost'
const FRONTEND_PORT = process.env.FRONTEND_PORT || 5173
const CORS_ORIGINS = (process.env.CORS_ORIGIN ||
  [
    `http://${APP_HOST}:${FRONTEND_PORT}`,
    `https://${APP_HOST}`,
    `http://${APP_HOST}`,
  ].join(','))
  .split(',')
  .map((origin) => origin.trim())
  .filter(Boolean)

app.use(cors({
  origin(origin, callback) {
    if (!origin || CORS_ORIGINS.includes(origin)) {
      return callback(null, true)
    }
    return callback(new Error(`CORS blocked for origin: ${origin}`))
  },
}))
app.use(express.json())

app.use('/api/persons',   personsRoutes)
app.use('/api/platforms', platformsRoutes)
app.use('/api/ai',        aiRoutes)
app.use('/api/companies', companiesRoutes)
app.use('/api/auth',      authRoutes)

app.get('/health', (req, res) => res.json({ status: 'ok' }))

// Error handler
app.use((err, req, res, next) => {
  console.error(err)
  const statusCode = Number.isInteger(err.statusCode) ? err.statusCode : 500
  const payload = { error: err.message || 'Internal server error', code: statusCode }
  if (err.details) payload.details = err.details
  res.status(statusCode).json(payload)
})

app.listen(PORT, '0.0.0.0', () => {
  console.log(`Archiver backend running on port ${PORT}`)
})
