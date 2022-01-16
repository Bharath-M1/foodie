const express = require("express");
const router = express.Router();
const product = require("../controller/productController");

router
  .route("/product")
  .get(product.get)
  .post(product.create)
  .put(product.updateQuantity)
  .delete();
router
  .route("/singleProduct")
  .get(product.getParticularProduct)
  .post(product.create)
  .put()
  .delete();
router.route("/getProductsfromSingleStore/:store").get(product.getStoreProduct);
module.exports = router;
