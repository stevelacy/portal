jwt = require 'jwt-simple'
User = require '../../models/User'
config = require '../../config'

module.exports = (req, res, next) ->

#  token = req.body and req.body.access_token or req.body and req.query.access_token or req.headers['x-access-token']
  token = req.headers['x-access-token']
  console.log req.headers
  if token
    try
      decoded = jwt.decode token, config.jwt.secret
      User.findById decode.iss, (err, user) ->
        return next() if err?
        req.user = user
        return next()
    catch e
      return next()
  return next()
