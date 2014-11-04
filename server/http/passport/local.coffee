mongoose = require 'mongoose'
passport = require 'passport'
jwt = require 'jwt-simple'
LocalStrategy = require('passport-local').Strategy

config = require '../../config'
db = require '../../db'

User = db.models.User

handleLogin = (email, password, cb) ->
  User.findOne email: email, (err, user) ->
    return cb err if err?
    return cb null, false unless user?
    user.comparePassword password, (err, match) ->
      return cb err if err?
      return cb null, false, message: 'Invalid password' unless match
      token = jwt.encode
        iss: user._id
      , config.jwt.secret
      user.set token: token
      user.save (err, doc) ->
        return cb err if err?
        return cb null, doc

strategy = new LocalStrategy handleLogin

passport.use strategy

passport.serializeUser (user, cb) ->
  cb null, user._id

passport.deserializeUser (id, cb) ->
  User.findOne _id: id, cb

module.exports = passport
