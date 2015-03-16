tungsten = require 'tungsten'
db = require '../../db'
config = require '../../config'

{User} = db.models

module.exports = (req, res, next) ->

  token = if req.query?.token then req.query.token else req.headers['x-access-token']
  return next() unless token?
  tungsten.decode token, config.token.secret, (err, decoded) ->
    return next() if err?
    if decoded.exp <= Date.now() or !decoded.exp
      return next()
    User.findById decoded.id, (err, user) ->
      return next() if err?
      req.user = user
      return next()
