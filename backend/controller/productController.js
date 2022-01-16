const products = require("../model/products");
const multer = require("multer");
const path = require("path");

// const upload = multer({
//   storage: multer.diskStorage({
//     destination: "/upload/images",
//     filename: (req, res, (cb) => {
//       cb(null, Date.now() + path.extname(file.originalname))
//     })
//   }),
//   limits: { fileSize: 20000000 },
//   fileFilter: (req, file, cb) => {
//     const validFileTypes = /jpg|jpeg|png/
//     const extname = validFileTypes.test(path.extname(file.originalname).toLowerCase())
//     if (extname === true) {
//       return cb(null, true)
//     } else {
//       return cb("Error: Images Only!")
//     }
//   }
// }).single("myImage")

exports.create = (req, res) => {
  products
    .create({
      name: req.body.name,
      quantity: req.body.quantity,
      store: req.body.store,
      type: req.body.type,
      varient: req.body.varient,
      ingredients: req.body.ingredients,
      category: req.body.category,
      rate: req.body.rate,
    })
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      if (err)
        return res.json({
          msg: "problem while creating the product",
          error: err,
        });
    });
};

exports.get = (req, res) => {
  products
    .find({})
    .populate("store")
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      if (err)
        return /* res.status(500).send(`There was a problem creating the user. ${err}`) */ res.json(
          { err: err }
        );
    });
};

exports.getParticularProduct = (req, res) => {
  products
    .find({ store: req.body.store, _id: req.body._id })
    .populate("store")
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      if (err)
        return /* res.status(500).send(`There was a problem creating the user. ${err}`) */ res.json(
          { err: err }
        );
    });
};

exports.getStoreProduct = (req, res) => {
  // console.log(req.body, req.params, "waiting for id");
  products
    .find({ store: req.params.store })
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      if (err)
        return /* res.status(500).send(`There was a problem creating the user. ${err}`) */ res.json(
          { err: err }
        );
    });
};

exports.updateQuantity = (req, res) => {
  console.log(req.body);
  products
    .findOneAndUpdate(
      { _id: req.body.id },
      { $set: { quantity: req.body.quantity } }
    )
    .then((data) => {
      console.log(data);
    })
    .catch((err) => {
      console.log(err);
    });
};
