const mongoose = require('mongoose')
const db = require('../config/dbConfig')

const createStore = mongoose.Schema({
  name: {
    type: String,
    require: true
  },
  seating: {
    type: Number,
    require: true
  }
  // items: {
  //   type: Object,
  //   requ
  // }
}, { timestamps: true })

module.exports = db.studentDatabase.model('store', createStore)