const router = require('express').Router()
const { listPlatforms } = require('../controllers/platformsController')

router.get('/', listPlatforms)

module.exports = router
