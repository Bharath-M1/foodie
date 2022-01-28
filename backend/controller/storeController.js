const store = require("../model/store");

exports.create = (req, res) => {
  store
    .create({
      storeName: req.body.name,
      seating: req.body.seating,
    })
    .then((data) => {
      res.send("Added Successfully");
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

exports.delete = (req, res) => {
  console.log(req.body);
  store
    .deleteOne({ _id: req.params.id })
    .then((data) => {
      res.send("Store Deleted");
    })
    .catch((err) => {
      console.log(err);
    });
};
