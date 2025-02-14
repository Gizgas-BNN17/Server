// Step 1 import ... 
const express = require('express')
const router = express.Router()
const { authCheck, adminCheck } = require('../middlewares/authCheck')

//Step 2 import controller
const { payment } = require('../controllers/stripe')

//router
router.post('/payment/success', authCheck, adminCheck, payment)


module.exports = router
