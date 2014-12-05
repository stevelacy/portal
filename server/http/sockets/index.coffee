socketioJwt = require 'socketio-jwt'
server = require '../httpServer'
config = require '../../config'
plugins = require '../plugins'
io = require('socket.io')(server)


io.use socketioJwt.authorize
  secret: config.jwt.secret
  handshake: true


io.on 'connection', (socket) ->
  console.log 'connected'

  module.exports.socket = socket

  plugins socket


  socket.emit 'system:notification',
    title: 'title'
    message: 'the is a message'
    type: 'success'
  setTimeout ->
    socket.emit 'system:notification',
      title: 'title'
      message: 'the is a message'
      type: 'alert'
  , 2000
  setTimeout ->
    socket.emit 'system:notification',
      title: 'title'
      message: 'the is a message'
  , 3000

  setTimeout ->
    socket.emit 'system:notification',
      title: 'title'
      message: 'the is a message'
      type: 'error'
  , 4000


  socket.on 'test', (data) ->
    console.log 'test worked', data
    socket.emit 'test', test: 'that'

module.exports = io
