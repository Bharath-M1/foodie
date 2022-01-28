const express = require("express");
const router = express.Router();
const user = require("../controller/userController");

router
  .route("/user")
  .get(user.getAll)
  .post(user.create)
  .put(user.updateUser)
  .delete();
router.route("/login").get().post(user.login).put().delete();
router.route("/getUser").post(user.getUser);
router.route("/user/:id").get(user.getOneUser);
router.route("/updateUser").put(user.updateUser);
router.route("/updateWallet").put(user.updateWallet);

module.exports = router;
