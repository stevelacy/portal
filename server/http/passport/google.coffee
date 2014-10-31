db = require '../../db'
User = db.model 'User'
passport = require 'passport'
{OAuth2Strategy} = require 'passport-google-oauth'
config = require '../../config'
app = require '../express'
express = require 'express'


handleFunction = (token, tokenSecret, profile, cb) ->
  User.findOne {id: profile.id}, (err, user) ->
    return cb err if err?
    profileUpdate =
      id: String profile.id
      token: token
      tokenSecret: tokenSecret
      name: profile.displayName
      email: profile.emails?[0]?.value
      username: profile.id
      image: profile._json.picture
      location: profile._json.locale
    if user?
      console.log "user exists"
      user.set profileUpdate
      user.save cb
    else
      console.log "user doesn't exist"
      User.create profileUpdate, (err, doc) ->
        console.log err, doc
        return cb err if err?
        cb null, doc

strategy = new OAuth2Strategy
  clientID: config.google.clientId
  clientSecret: config.google.clientSecret
  callbackURL: config.google.callback
, handleFunction

passport.use strategy
passport.serializeUser (user, cb) ->
  cb null, user.id

passport.deserializeUser (id, cb) ->
  User.findOne {id:String(id)}, cb

app.use passport.initialize()
app.use passport.session()

app.get '/auth/google', passport.authenticate 'google', scope: 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/userinfo.email'
app.get '/auth/google/callback', passport.authenticate 'google',
  successRedirect: '/'
  failureRedirect: '/login?failed=true'

module.exports = passport
