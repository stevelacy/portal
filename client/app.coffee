Fission = require 'fission'
fission = new Fission()
global.fission = fission
fission.config = window._config

fission.socket = io()
fission.socket.on 'connect', ->
  console.log 'connected'


module.exports = fission
