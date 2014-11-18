jwt = require 'jwt-simple'
setup = require '../setup'
config = require '../../config'

id = setup.newId()

token = jwt.encode
  iss: id
, config.jwt.secret

module.exports =
  _id: id
  name: 'John Smith'
  token: token
  email: 'me@my.me'
  password: 'sosecure'
