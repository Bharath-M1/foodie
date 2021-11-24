const user = require('../model/user')
require('dotenv').config()
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')
//create a new student 
exports.create = (req, res) => {
  /* only hashsync create a password not hash in bcrypt */
  console.log(req.body.password);
  const hashedPass = bcrypt.hashSync(req.body.password, 8)
  user.create(
    {
      name: req.body.name,
      mobileNo: req.body.mobileNo,
      password: hashedPass,
      email: req.body.email,
      dateOfBirth: req.body.dateOfBirth,
      gender: req.body.gender,
      address: req.body.address,
      role: req.body.role,
      regNo: req.body.regNo,
      dept: req.body.dept
    })
    .then(data => {
      res.json({ status: "ok", data: data })
    })
    .catch(err => {
      res.json({ status: "err", err: err.message })
    });
}

// update a student
exports.updateUser = (req, res) => {
  console.log(req.body.id)
  user.updateOne({ _id: req.body.id }, {
    name: req.body.name,
    mobileNo: req.body.mobileNo,
    email: req.body.email,
    dateOfBirth: req.body.dateOfBirth,
    gender: req.body.gender,
    address: req.body.address
  }).then(data => { res.send(data) })
    .catch(err => {
      res.status(500)
        .send({
          message: err.message || "Some error occurred while creating the Student."
        });
    });
}

//logining in student
exports.login = (req, res) => {
  let password = req.body.password
  user.findOne({ mobileNo: req.body.mobileNo })
    .then(async (data) => {
      const authUser = await bcrypt.compareSync(password, data.password)
      if (authUser) {
        const token = jwt.sign({ id: data._id, role: data.role }, process.env.SECRET, { algorithm: 'HS256' })
        res.header("Bearer", token);
        res.json({ token: "Bearer " + token, data: data, status: "ok", message: "Successfully logged in" })
      } else {
        res.json({ message: "In correct Password", status: "err" })
      }
    }).catch(err => res.json({ status: "err", err: err.message }))

}