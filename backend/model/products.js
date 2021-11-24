const mongoose = require('mongoose')

const schema = mongoose.Schema
const productSchema = mongoose.Schema({
  name: { type: String, required: true },
  quantity: { type: String, required: true },
  store: { type: schema.Types.ObjectId, required: true }
}, { timestamps: true })



module.exports = mongoose.model('product', productSchema);