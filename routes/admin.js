// Step 1 import ... 
const express = require('express')
const router = express.Router()
//Step 2 import controller
const { authCheck } = require('../middlewares/authCheck')

//Step 2 import controllers
const { changeOrderStatus, getOrderAdmin} = require('../controllers/admin')

//router
router.put('/admin/order-status', authCheck,changeOrderStatus)
router.get('/admin/orders', authCheck,getOrderAdmin)


module.exports = router