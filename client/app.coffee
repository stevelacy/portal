Fission = require 'fission'
fission = new Fission()
fission.config = window._config

fission.socket = io()
fission.socket.on 'connect', ->
  console.log 'connected'


module.exports = fission
