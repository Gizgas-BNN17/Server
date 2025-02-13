// Step 1 import ... 
const express = require('express')
const router = express.Router()
const { authCheck, adminCheck } = require('../middlewares/authCheck')

// Step 2 import controllers
const { create, list, remove } = require('../controllers/category')

//router
router.post('/category', authCheck, adminCheck, create)
router.get('/category', authCheck, adminCheck, list)
router.delete('/category/:id', authCheck, adminCheck, remove)


module.exports = router