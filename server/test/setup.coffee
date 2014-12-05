mongoose = require 'mongoose'
jwt = require 'jwt-simple'

config = require '../config'

date = new Date()
createId = String mongoose.Types.ObjectId()

token = jwt.encode
  iss: createId
  exp: date + 345600000
, config.jwt.secret


module.exports =
  user:
    _id: createId
    name: 'John Smith'
    token: token
    email: 'me@my.me'
    password: 'sosecure'
    username: 'jsmith'

  plugin:
    _id: createId
    name: 'test-plugin'
    main: 'test.coffee'
    widget:
      html: 'test.html'
