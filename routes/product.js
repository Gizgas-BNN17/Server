// Step 1 import ... 
const express = require('express')
const router = express.Router()

//Step 2 import controllers
const { create, list, read, update, remove, listby, search, createImages, removeImages } = require('../controllers/product')
//import Middleware
const { authCheck, adminCheck } = require('../middlewares/authCheck')
//router
router.post("/product", create)
router.get("/products/:count", list)
router.get("/product/:id", read)
router.put("/product/:id", update)
router.delete("/product/:id", remove)
router.post("/productby", listby)
router.post("/search/filters", search)

router.post("/images", authCheck, adminCheck, createImages)
router.post("/removeimages", authCheck, adminCheck, removeImages)

module.exports = router