const router = require('express').Router()
const { aiQuery } = require('../controllers/aiController')

router.post('/query', aiQuery)

module.exports = router
