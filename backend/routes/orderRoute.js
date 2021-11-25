const express = require('express')
const router = express.Router()
const order = require('../controller/orderController')

router.route("/order").post(order.createOrder)

module.exports = router