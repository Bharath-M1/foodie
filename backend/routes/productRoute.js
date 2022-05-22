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
  .get()
  .post(product.getParticularProduct)
  .put()
  .delete();
router.route("/product/:id").delete(product.delete);
router.route("/getProductsfromSingleStore/:store").get(product.getStoreProduct);
router.route("/getProductsbyStore").post(product.getProductsbyStore);
module.exports = router;
