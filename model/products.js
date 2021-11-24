const mongoose = require('mongoose')
const db = require(`../config/dbConfig`)
const schema = mongoose.Schema
const productSchema = mongoose.Schema({
  name: { type: String, required: true },
  quantity: { type: String, required: true },
  store: { type: schema.Types.ObjectId, required: true }
}, { timestamps: true })

module.exports = db.studentDatabase.model('product', productSchema);