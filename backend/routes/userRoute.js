const express = require('express')
const router = express.Router()
const user = require('../controller/userController')

router.route('/user').get().post(user.create).put(user.updateUser).delete()
router.route('/login').get().post(user.login).put().delete()

module.exports = router