jwt = require 'jwt-simple'
setup = require '../setup'
config = require '../../config'

id = setup.newId()

token = jwt.encode
  iss: id
, config.jwt.secret


console.log id, token

module.exports =
  _id: id
  name: 'John Smith'
  token: token
  email: 'me@my.me'
  password: 'sosecure'
