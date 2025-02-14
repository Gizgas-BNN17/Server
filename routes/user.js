// Step 1 import ... 
const express = require('express')
const router = express.Router()
const { authCheck, adminCheck } = require('../middlewares/authCheck')

//Step 2 import controller
const { list, changeStatus, changeRole, userCart, getUserCart, emtyCart, saveAddress, saveOrder, getOrder } = require('../controllers/user')

//router
router.get('/users', authCheck, adminCheck, list)
router.post('/change-status', authCheck, adminCheck, changeStatus)
router.post('/change-role', authCheck, adminCheck, changeRole)

router.post('/user/card', authCheck, userCart)
router.get('/user/cart', authCheck, getUserCart)
router.delete('/user/cart', authCheck, emtyCart)
router.post('/user/address', authCheck, saveAddress)
router.post('/user/order', authCheck, saveOrder)
router.get('/user/order', authCheck, getOrder)

module.exports = router
