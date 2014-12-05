jwt = require 'jwt-simple'
setup = require '../setup'
config = require '../../config'

id = setup.newId()
date = new Date()

token = jwt.encode
  iss: id
  exp: date + 345600000
, config.jwt.secret

module.exports =
  _id: id
  name: 'John Smith'
  token: token
  email: 'me@my.me'
  password: 'sosecure'
  username: 'jsmith'
