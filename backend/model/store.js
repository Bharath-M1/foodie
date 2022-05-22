const mongoose = require("mongoose");

const createStore = mongoose.Schema(
  {
    storeName: {
      type: String,
      require: true,
    },
    seating: {
      type: Number,
      require: true,
    },
    banner:{
      type:String,
      require:false,
    }
    // items: {
    //   type: Object,
    //   requ
    // }
  },
  { timestamps: true }
);

module.exports = mongoose.model("store", createStore);
