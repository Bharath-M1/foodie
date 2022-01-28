const mongoose = require("mongoose");
const store = require("../model/store");
const product = require("../model/products");
const user = require("../model/user");
const schema = mongoose.Schema;

const orderSchema = mongoose.Schema({
  userId: { require: true, type: schema.Types.ObjectId, ref: user },
  products: [
    {
      productId: {
        require: true,
        type: schema.Types.ObjectId,
        ref: product,
      },
      quantity: { type: Number, require: true },
    },
  ],
  orderId: {
    type: Number,
    default: () => {
      return Math.floor(Math.random() * 70000 * Math.random()) + 30000;
    },
  },
  // products: { type: Array, require: true },
  storeId: { require: true, type: schema.Types.ObjectId, ref: store },
  billvalue: { type: Number, require: true },
  status: {
    type: String,
    require: true,
    enum: ["delivered", "not_delivered"],
  },
});

module.exports = mongoose.model("order", orderSchema);
