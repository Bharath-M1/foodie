const mongoose = require('mongoose')
const Schema = mongoose.Schema
const user = require('../model/user')

const historySchema = mongoose.Schema({
  userId: { required: true, ref: user, type: Schema.Types.ObjectId, },
  amount: { required: true, type: Number }
}, { timestamps: true })



module.exports = mongoose.model('history', historySchema);