const store = require('../model/store')

exports.create = (req, res) => {
  store.create({
    name: req.body.name,
    seating: req.body.seating
  })
    .then((data) => { res.send(data) })
    .catch(err => console.log(err))
}


exports.get = (req, res) => {
  store.find({}).select("_id")
    .then((data) => { res.send(data) })
    .catch(err => console.log(err))
}