const router = require('express').Router()
const { listPersons, getPerson, getPersonPosts } = require('../controllers/personsController')

router.get('/',           listPersons)
router.get('/:id',        getPerson)
router.get('/:id/posts',  getPersonPosts)

module.exports = router
