const express = require("express");
const router = express.Router();
const order = require("../controller/orderController");

router.route("/order").post(order.createOrder).delete(order.deleteOrder);
router.route("/order/:id").delete(order.deleteOrder);
router.route("/getOrders").post(order.getAllOrderByUser);

module.exports = router;
