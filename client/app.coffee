Fission = require 'fission'
Sync = require 'ampersand-sync'

window._token = window.localStorage.getItem 'token'
tokenSync = (method, model, options) ->

  if window._token?
    options.headers =
      'x-access-token': window._token
  Sync method, model, options


fission = new Fission
  sync: tokenSync

global.fission = fission
fission.config = window._config
fission.socket = io()

fission.socket.on 'connect', ->
  console.log 'connected'

module.exports = fission
