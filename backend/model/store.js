const mongoose = require('mongoose')


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



module.exports = mongoose.model('store', createStore)