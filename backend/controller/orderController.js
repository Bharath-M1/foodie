const order = require("../model/orderHistory");
const user = require("../model/user");
const product = require("../model/products");

//create a new order body=userid,productid,quantity,storeid
exports.createOrder = (req, res) => {
  const body = req.body;
  // console.log(body);
  user
    .findOne({ _id: body.userId })
    .then((data) => {
      if (data.balance > body.billvalue) {
        let products = req.body.products;
        products.map(async (eachProduct) => {
          try {
            let productt = await product.findOne({
              _id: eachProduct.productId,
            });
            if (productt.quantity > eachProduct.quantity) {
              productt.quantity = productt.quantity - eachProduct.quantity;
              productt.save();
            } else {
              res.json({ msg: "insufficient quantity" });
            }
            // console.log(productt, productt.quantity, eachProduct.quantity);
          } catch (err) {
            console.log(err);
          }
        });
        try {
          let balanceMinus = user.findOne({ _id: body.userId });
          balanceMinus.balance = balanceMinus.balance - body.billvalue;
          balanceMinus.save();
        } catch (err) {
          console.log(err);
        }
        order
          .create({
            userId: req.body.userId,
            products: [
              {
                productId: req.body.productId,
                quantity: req.body.quantity,
              },
            ],
            storeId: req.body.storeId,
            billvalue: req.body.billvalue,
          })
          .then((data) =>
            res.json({
              msg: "successfully order created",
              data: data,
            })
          )
          .catch((err) => {
            if (err)
              return res
                .status(500)
                .send("There was a problem creating the user.");
          });
      } else {
        res.json({ msg: "insufficient balance" });
      }
    })
    .catch((err) => {
      // console.log(err);
      if (err)
        return res.status(500).send("There was a problem creating the user.");
    });
};

//get all products using userId
exports.getAllOrderByUser = (req, res) => {
  order
    .find({ userId: req.body.userId })
    .populate("userId products.productId storeId")
    .then((data) => res.json({ msg: "successfully fetched", data: data }))
    .catch((err) => {
      // console.log(err);
      if (err)
        return res.status(500).send("There was a problem creating the user.");
    });
};
