const express = require("express");
const router = express.Router();
const cart = require("../controller/cartController");

router.route("/product").get(product.get).post(product.create).put().delete();
router.route("/cart").get(cart.getAll).post(cart.addCart).put().delete();
router.route("/getProductsfromSingleStore/:store").get(product.getStoreProduct);
module.exports = router;
