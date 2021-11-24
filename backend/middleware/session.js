const sessionChecker = (req, res, next) => {
  if (req.cookies.user_id && req.session.user) {
    res.redirect('/home')
  } else {
    next()
  }
}

module.exports = sessionChecker