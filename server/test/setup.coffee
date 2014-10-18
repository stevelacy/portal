passport = require 'passport'
mongoose = require 'mongoose'

db = require '../db'
config = require '../config'

User = db.model 'User'

should = require 'should'
require 'mocha'

# hack passport to work with a fake user
# provided by the tests
originalInit = passport.initialize()

hookedInit = (req, res, next) ->
  return originalInit req, res, next unless req.query._user?
  req._passport = instance: passport

  User.findById String(req.query._user), (err, user) ->
    return next err if err?
    req._passport.session =
      user: user
    req.user = user
    next()

passport.initialize = -> hookedInit

# some utils
setup =
  newId: -> String mongoose.Types.ObjectId()

  user:
    createQuery: (id) -> _user: id

module.exports = setup
