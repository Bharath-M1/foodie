const mongoose = require('mongoose')
require("dotenv").config();

mongoose.studentDatabase = mongoose.createConnection(process.env.DB_CLUSTER_STUDENT, {
  useUnifiedTopology: true,
  useNewUrlParser: true,
  useCreateIndex: true
})

mongoose.adminDatabase = mongoose.createConnection(process.env.DB_CLUSTER_ADMIN, {
  useUnifiedTopology: true,
  useNewUrlParser: true,
  useCreateIndex: true
})
module.exports = mongoose