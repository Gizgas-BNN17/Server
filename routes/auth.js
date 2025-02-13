// Step 1 import ... 
const express = require('express')
const router = express.Router()

//Step 2 import controllers
const { register, login, currentUser } = require('../controllers/auth')
//import Middleware
const { authCheck, adminCheck } = require('../middlewares/authCheck')
//router
router.post('/register', register)
router.post('/login', login)
router.post('/current-user', authCheck, currentUser)
router.post('/current-admin', authCheck, adminCheck, currentUser)


module.exports = router