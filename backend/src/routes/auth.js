const router = require('express').Router()
const { generateAndLogin, deleteAccount } = require('../controllers/authController')

router.post('/login',   generateAndLogin)
router.delete('/account', deleteAccount)

module.exports = router
