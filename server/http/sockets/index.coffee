socketioJwt = require 'socketio-jwt'
sessionStore = require '../express/sessionStore'
server = require '../httpServer'
config = require '../../config'
plugins = require '../plugins'
io = require('socket.io')(server)


io.use socketioJwt.authorize
  secret: config.jwt.secret
  handshake: true


io.on 'connection', (socket) ->
  console.log 'connected'

  console.log socket.handshake.decoded_token


  module.exports.socket = socket

  plugins socket

  socket.on 'test', (data) ->
    console.log 'test worked', data
    socket.emit 'test', test: 'that'


module.exports = io
