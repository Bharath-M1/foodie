const store = require("../controller/storeController");
const express = require("express");
const router = express.Router();
const passport = require("passport");

// router.use(passport.authenticate("jwt", { session: false }));
router.route("/store").get(store.get).put().post(store.uploadImage,store.create);
router.route("/store/:id").delete(passport.authenticate("jwt", { session: false }),store.delete);
router.route("/getOne").post(passport.authenticate("jwt", { session: false }),store.getOne);
router.route("/upload").post(store.uploadImage,store.upload)
module.exports = router;
