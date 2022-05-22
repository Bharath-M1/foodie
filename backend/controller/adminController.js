const user = require('../model/user')
const history = require('../model/salesHistory')

//add balance to student using register no
exports.addBalance = async (req, res) => {
  try {
    let users = await user.findOne({ regNo: req.body.regNo })
    users.balance = users.balance + req.body.amount
    users.save()
    history.create({ userId: users._id, amount: req.body.amount })
    res.json({ msg: "successfully addedd Amount", data: users })
  }
  catch (err) {
    res.status(500)
      .json({
        message: err.message, msg: "Some error occurred while adding amount."
      });
  }
}

//get all users in database
exports.getAllusers = (req, res) => {
  user.find().select("name dept balance")
    .then((data) => {
      res.json({ msg: "retrieved", data: data })
    }).catch(err => {
      res.status(500)
        .send({
          message: err.message || "Some error occurred while creating the Student."
        });
    });
}

//get personal user transactions
exports.getTransactionsOfUser = (req, res) => {
  user.findOne({ regNo: req.body.regNo })
    .then((data) => {
      if (data) {
        history.find({ userId: data._id }).populate("userId")
          .then(transaction => {
            res.json({ data: transaction, msg: "successfully retrived transactions" })
          }).catch(err => console.log(err))
      }
      else {
        res.json({ msg: "usernot found" })
      }
    }).catch(err => console.log(err))
}

