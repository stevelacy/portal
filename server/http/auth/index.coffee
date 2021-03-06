db = require '../../db'
app = require '../express'
log = require '../../lib/log'
config = require '../../config'
validateUser = require './validateUser'
createAuthScript = require './createAuthScript'

{User} = db.models

app.post '/logout', (req, res, next) ->
  User.findOne token: req.query?.token, (err, user) ->
    return next err if err?
    return next() unless user?
    user.set token: null
    user.save (err, doc) ->
      return next err if err?
      delete req.user
      res.redirect '/'

app.post '/auth', (req, res, next) ->
  return next() unless req.user?
  src = createAuthScript req.user
  res.status(200).send src

app.post '/login', (req, res, next) ->

  return res.status(401).send error: 'missing parameters' unless req.body?.email? and req.body?.password?

  req.body.email = req.body.email.toLowerCase()

  validateUser req.body.email, req.body.password, (err, user) ->
    return res.status(500).json err if err?

    unless user?
      msg = 'email or password incorrect'
      log.error msg
      return res.status(401).json status: 'error', message: msg

    user.password = undefined

    res.status(200).json
      status: 'success'
      token: user.token
      user: user

app.post '/register', (req, res, next) ->
  return res.status(401).send error: 'missing parameters' unless req.body?.email? and req.body?.password?
  user = new User
    email: req.body.email
    password: req.body.password
    name: req.body.name
  user.save (err, doc) ->
    log.error err if err?
    res.status(201).json doc
