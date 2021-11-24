const mongoose = require('mongoose')


const connectDB = () => {
  mongoose.Promise = global.Promise;
  mongoose.connect(process.env.DB_CLUSTER, {
    useUnifiedTopology: true,
    useNewUrlParser: true,
    useCreateIndex: true
  }).then(() => {
    console.log("Successfully connected to database 🚀 ")
  }).catch(err => console.log(err))
}


module.exports = connectDB;