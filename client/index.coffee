{React} = require 'fission'

request = require 'superagent'
router = require './router'
io = require 'socket.io-client'

window.socket = io '',
  query: "token=#{window.token}"

window.config =
  url: 'http://localhost:5000'
  socketUrl: window._config.socketUrl

window.socket.on 'connect', ->
  console.log 'connected'

request.post "#{window._config.url}/auth?token=#{window.token}", (err, res) ->
  window._user = res?.body
  router.start document.body
