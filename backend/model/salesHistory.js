const mongoose = require('mongoose')
const Schema = mongoose.Schema


const historySchema = mongoose.Schema({
  userId: { required: true, ref: 'User', type: Schema.Types.ObjectId, },
  amount: { required: true, type: Number }
}, { timestamps: true })



module.exports = mongoose.model('history', historySchema);