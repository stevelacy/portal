db = require '../../db'
app = require '../express'
log = require '../../lib/log'
config = require '../../config'
checkUser = require './checkUser'
createAuthScript = require './createAuthScript'

User = db.model 'User'

app.get '/logout', (req, res) ->
  delete req.user
  res.redirect '/'

app.get '/auth.js', (req, res) ->
  src = createAuthScript req.user
  res.set 'Content-Type', 'application/javascript'
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

    res.status(200).json
      status: 'success'
      token: user.token
