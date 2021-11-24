const admin = require('../controller/adminController')
const express = require('express')
const router = express.Router()

router.route('/admin/addamount').get().post(admin.addBalance).put().delete()
router.route('/admin/getallusers').post(admin.getAllusers)
router.route('/admin/transactions').post(admin.getTransactionsOfUser)


module.exports = router