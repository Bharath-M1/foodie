const order = require("../model/orderHistory");
const user = require("../model/user");
const product = require("../model/products");

//create a new order body=userid,productid,quantity,storeid
exports.createOrder = (req, res) => {
  const body = req.body;
  user
    .findOne({ _id: body.userId })
    .then(async (data) => {
      if (data.balance > body.billvalue) {
        var products = req.body.products;
        products.map(async (eachProduct) => {
          try {
            let productt = await product.findOne({
              _id: eachProduct.productId,
            });
            if (productt.quantity >= eachProduct.quantity) {
              productt.quantity = productt.quantity - eachProduct.quantity;
              productt.save();
            } else {
              res.json({ msg: "insufficient quantity" });
            }
          } catch (err) {
            console.log(err);
          }
        });

        try {
          let balanceMinus = await user.findOne({ _id: body.userId });
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
                productId: body.products[0].productId,
                quantity: body.products[0].quantity,
              },
            ],

            storeId: req.body.storeId,
            billvalue: req.body.billvalue,
          })
          .then((data) => {
            console.log(data);
            res.json({
              msg: "successfully order created",
              data: data,
            });
          })
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
  console.log(req.body);
  order
    .find({ userId: req.body.userId })
    .populate("userId products.productId storeId")
    .then((values) => {
      res.json({ msg: "successfully fetched", data: values });
    })
    .catch((err) => {
      // console.log(err);
      if (err)
        return res.status(500).send("There was a problem creating the user.");
    });
};

exports.getOrder = () => {};

exports.deleteOrder = (req, res) => {
  console.log(req.params.id);
  order
    .findOne({ _id: req.params.id })
    .then(async (data) => {
      await user
        .findOne({ _id: data.userId })
        .then((userData) => {
          user
            .findOneAndUpdate(
              { _id: userData._id },
              { $set: { balance: userData.balance + data.billvalue } }
            )
            .then(async (values) => {
              let complete = data.products;
              await product
                .findOne({ _id: complete[0].productId })
                .then((productData) => {
                  // console.log(typeof complete[0].quantity);
                  product
                    .findOneAndUpdate(
                      { _id: productData._id },
                      {
                        $set: {
                          quantity:
                            parseInt(productData.quantity) +
                            complete[0].quantity,
                        },
                      }
                    )
                    .then(async (final) => {
                      console.log(final);
                      await order.deleteOne({ _id: data._id }).then(() => {
                        res.send("Order Deleted");
                      });
                    });
                });
            })
            .catch((err) => {
              console.log(err);
            });
        })
        .catch((err) => {
          console.log(err);
        });
    })
    .catch((err) => {
      console.log(err);
    });
};
