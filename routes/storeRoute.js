const store = require('../controller/storeController')
const express = require('express')
const router = express.Router()
const passport = require('passport')


router.use(passport.authenticate('jwt', { session: false }))
router.route('/store').get(store.get).put().post(store.create).delete();

module.exports = router;