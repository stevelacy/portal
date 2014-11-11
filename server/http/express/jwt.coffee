jwt = require 'jwt-simple'
db = require '../../db'
config = require '../../config'

User = db.model 'User'

module.exports = (req, res, next) ->

#  token = req.body and req.body.access_token or req.body and req.query.access_token or req.headers['x-access-token']
  token = if req.query?.token then req.query.token else req.headers['x-access-token']
  return next() unless token?
  try
    decoded = jwt.decode token, config.jwt.secret
    console.log decoded
    User.findById decoded.iss, (err, user) ->
      return next() if err?
      req.user = user
      return next()
  catch e
    return next()
