require('dotenv').config()
const express = require('express')
const cors    = require('cors')

const personsRoutes   = require('./routes/persons')
const platformsRoutes = require('./routes/platforms')
const aiRoutes        = require('./routes/ai')

const app  = express()
const PORT = process.env.PORT || 4000

app.use(cors({ origin: '*' }))
app.use(express.json())

app.use('/api/persons',   personsRoutes)
app.use('/api/platforms', platformsRoutes)
app.use('/api/ai',        aiRoutes)

app.get('/health', (req, res) => res.json({ status: 'ok' }))

// Error handler
app.use((err, req, res, next) => {
  console.error(err)
  res.status(500).json({ error: err.message || 'Internal server error', code: 500 })
})

app.listen(PORT, '0.0.0.0', () => {
  console.log(`Archiver backend running on port ${PORT}`)
})
