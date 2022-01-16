const Cart = require("../model/cart");
const User = require("../model/user");
const Product = require("../model/products");

exports.addCart = (req, res) => {
  console.log(req.body);
  Product.findOne({ _id: req.body.product })
    .then((product) => {
      User.findOne({ _id: req.body.user }).then((user) => {
        Cart.findOne({ product: product._id, user: user._id }).then((cart) => {
          if (cart === null) {
            Cart.create({
              user: user._id,
              product: product._id,
              qty: 1,
              price: product.rate,
            }).then((data) => {
              console.log(data);
              res.send("Added to Cart");
            });
          } else {
            res.send("product exists");
          }
        });
      });
    })
    .catch((err) => {
      console.log(err);
    });
};

exports.getAll = (req, res) => {
  Cart.find({ user: req.body.user })
    .populate("user")
    .populate("product")
    .then((cart) => {
      res.send(cart);
    })
    .catch((err) => {
      console.log(err);
    });
};

exports.updateCart = async (req, res) => {
  await Cart.findOneAndUpdate(
    { _id: req.body.cart },
    {
      $set: {
        qty: req.body.quantity,
        price: req.body.price,
      },
    }
  )
    .then((data) => {
      res.json({ messsage: "updated", status: "success" });
    })
    .catch((err) => {
      res.json({ messag: "error", status: "error" });
    });
};

exports.deleteItem = (req, res) => {
  console.log(req.params.id);
  Cart.remove({ _id: req.params.id })
    .then((data) => {
      res.send("Item removed from Cart");
    })
    .catch((err) => {
      console.log(err);
    });
};
