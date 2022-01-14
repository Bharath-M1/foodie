const express = require("express");
const router = express.Router();
const cart = require("../controller/cartController");
const product = require("../controller/productController");

router.route("/product").get(product.get).post(product.create).put().delete();
router
  .route("/cart")
  .get()
  .post(cart.addCart)
  .put(cart.updateCart)
  .delete(cart.deleteItem);
router.route("/getCart").post(cart.getAll);
router.route("/cart/:id").delete(cart.deleteItem);
router.route("/getProductsfromSingleStore/:store").get(product.getStoreProduct);
module.exports = router;
