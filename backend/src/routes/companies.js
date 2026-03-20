const router = require('express').Router()
const { listCompanies, getCompany } = require('../controllers/companiesController')

router.get('/',    listCompanies)
router.get('/:id', getCompany)

module.exports = router
