db = require '../../db'
app = require '../express'
log = require '../../lib/log'
config = require '../../config'
checkUser = require './checkUser'
createAuthScript = require './createAuthScript'

User = db.model 'User'

app.post '/logout', (req, res, next) ->
  User.findOne token: req.query?.token, (err, user) ->
    return next err if err?
    return next() unless user?
    user.set token: null
    user.save (err, doc) ->
      return next err if err?
      delete req.user
      res.redirect '/'

app.post '/auth', (req, res) ->
  src = createAuthScript req.user
  res.status(200).send src

app.post '/login', (req, res, next) ->
  req.body.username = req.body.email

  checkUser req.body.email, req.body.password, (err, user) ->
    return res.status(500).json err if err?

    unless user?
      req.session ?= {}
      req.session.message = 'email or password incorrect'
      log.error req.session.message
      return res.status(401).json status: 'error', message: req.session.message

    u =
      name: user.name
      email: user.email
      token: user.token
      image: user.image
      online: user.online
    res.status(200).json
      status: 'success'
      token: user.token
      user: u


# TODO: app.post '/reigster', (req, res, next) ->
