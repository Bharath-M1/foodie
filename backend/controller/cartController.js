const Cart = require("../model/cart");
const User = require("../model/user");
const Product = require("../model/products");

exports.addCart = (req, res) => {
  Product.findOne({ _id: req.body.product })
    .then((product) => {
      User.findOne({ _id: req.body.user }).then((user) => {
        Cart.find({ product: product._id, user: user._id }).then((cart) => {
          if (cart) {
          } else {
            Cart.create({
              user: user._id,
              product: product._id,
              qty: 1,
              price: product.price,
            }).then((cart) => {
              res.send("Added to Cart");
            });
          }
        });
      });
    })
    .catch((err) => {
      console.log(err);
    });
};

exports.getAll = (req, res) => {
  Cart.find({})
    .populate("user")
    .populate("product")
    .then((cart) => {
      res.send(cart);
    })
    .catch((err) => {
      console.log(err);
    });
};
