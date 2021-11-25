const order = require('../model/orderHistory');
const user = require('../model/user');

exports.createOrder = (req, res) => {
  const body = req.body
  // console.log(body);
  user.findOne({ _id: body.userId })
  .then(
    data => {
      if (data.balance > body.billvalue) {
        
      } else {
        res.json({ "msg": "insufficient balance" })
      }
    }
  ).catch(err => {
    console.log(err);
    if (err) return res.status(500).send("There was a problem creating the user.")

  })
  // order.create({
  //   userId: req.body.userId,
  //   products: [{
  //     productId: req.body.productId,
  //     quantity: req.body.quantity
  //   }],
  //   storeId: req.body.storeId,
  //   billvalue: req.body.billvalue
  // }).then(data => res.json({
  //   msg: "successfully order created", data: data
  // })).catch(err => { if (err) return res.status(500).send("There was a problem creating the user.") })
}