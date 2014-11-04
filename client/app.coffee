Fission = require 'fission'
Sync = require 'ampersand-sync'

tokenSync = (method, model, options) ->
  token = window.localStorage.getItem 'token'
  console.log model, options
  if token
    options.headers =
      'x-access-token': token
  Sync method, model, options


fission = new Fission
  sync: tokenSync

global.fission = fission
fission.config = window._config
fission.socket = io()

fission.socket.on 'connect', ->
  console.log 'connected'


module.exports = fission
