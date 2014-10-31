passport = require 'passport'
db = require '../../db'
app = require '../express'
log = require '../../lib/log'
config = require '../../config'
createAuthScript = require './createAuthScript'

User = db.model 'User'

app.get '/logout', (req, res) ->
  req.logout()
  res.redirect '/'

app.get '/auth.js', (req, res) ->
  src = createAuthScript req.user
  res.set 'Content-Type', 'application/javascript'
  res.status(200).send src

app.post '/login', (req, res, next) ->
  req.body.username = req.body.email
  passport.authenticate('local', (err, user, info) ->
    log.error err if err?
    return res.status(500).json err if err?
    unless user?
      log.error info.message
      req.session.message = [info.message]
      return res.status(401).json status: 'error'
    req.logIn user, (err) ->
      log.error err if err?
      return res.status(401).json error: 'email or password incorrect' if err?
      return res.status(200).json status: 'success'

  ) req, res, next

module.exports = passport
