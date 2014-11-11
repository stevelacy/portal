mongoose = require 'mongoose'
jwt = require 'jwt-simple'

config = require '../../config'
db = require '../../db'

User = db.models.User

module.exports = (email, password, cb) ->
  User.findOne email: email, (err, user) ->
    return cb err if err?
    return cb null, null unless user?
    user.comparePassword password, (err, match) ->
      return cb err if err?
      return cb null, null unless match
      token = jwt.encode
        iss: user._id
      , config.jwt.secret
      user.set token: token
      user.save (err, doc) ->
        return cb err if err?
        return cb null, doc
