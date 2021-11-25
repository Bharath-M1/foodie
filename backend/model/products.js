const mongoose = require('mongoose')
const schema = mongoose.Schema
const store = require('../model/store')

const productSchema = mongoose.Schema({
  name: { type: String, required: true, },
  quantity: { type: String, required: true },
  store: { type: schema.Types.ObjectId, required: true, ref: store },
  type: { type: String },
  varient: { type: String },
  ingredients: { type: Array },
  category: { type: String, enum: ["veg", "non-veg"] },
  rate: { type: Number, required: true }
}, { timestamps: true })



module.exports = mongoose.model('product', productSchema);