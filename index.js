const express = require('express');
const cors = require('cors');
const passport = require('passport')
require('./auth/passport')(passport)
// const session = require("express-session");
// const connectDb = require('./config/dbConfig')
const morgan = require('morgan');
// const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
/* express intialization */
const app = express()
require('./auth/passport')(passport)
// const sessionChecker = require('./middleware/session')
/* middlewares and configure */
require('dotenv').config()
app.use(morgan("dev"))
app.use(cors());
app.use(cookieParser())
// app.use(session({
//     key: "user_id",
//     secret: process.env.SECRET,
//     resave: false,
//     saveUninitialized: false,
//     cookie: {
//         expires: 600000,
//     }
// }))
// app.use((req, res, next) => {
//     if (req.cookies.user_id && !req.session.user) {
//         res.clearCookie("user_id")
//     } else {
//         next()
//     }
// })
app.use(express.urlencoded({ extended: true }))
app.use(express.json())
app.use(passport.initialize())
app.use(passport.session())

/* Router */
app.use('/home',
    require('./routes/userRoute'),
    require('./routes/productRoute'),
    require('./routes/storeRoute'),
    require('./routes/adminRoute')
)

app.get('/', (req, res) => {
    res.json({ redirect: "/login" });
});

/* connecting to database */
// connectDb()


// listen for requests
app.listen(5000, () => {
    console.log(`server is running at port : http://localhost:5000 😇 `);
});