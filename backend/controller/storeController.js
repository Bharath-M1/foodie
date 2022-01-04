const store = require("../model/store");

exports.create = (req, res) => {
  store
    .create({
      name: req.body.name,
      seating: req.body.seating,
    })
    .then((data) => {
      res.send(data);
    })
    .catch((err) => console.log(err));
};

exports.get = (req, res) => {
  store
    .find({})
    .then((data) => {
      res.send(data);
    })
    .catch((err) => console.log(err));
};

exports.getOne = (req, res) => {
  console.log(req.body.id);
  store
    .findOne({ _id: req.body.id })
    .then((data) => {
      res.send(data);
    })
    .catch((err) => console.log(err));
};
