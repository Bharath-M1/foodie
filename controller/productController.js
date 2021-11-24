const products = require('../model/products')


exports.create = (req, res) => {
  products.create([{
    name: req.body.name,
    quantity: req.body.quantity
  }])
    .then(data => { res.send(data) })
    .catch(err => { if (err) return res.status(500).send("There was a problem creating the user.") })
}


exports.get = (req, res) => {
  products.find({})
    .then(data => { res.send(data) })
    .catch(err => { if (err) return res.status(500).send("There was a problem creating the user.") })
}
