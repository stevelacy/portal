tungsten = require 'tungsten'
server = require '../httpServer'
config = require '../../config'
plugins = require '../plugins'
io = require('socket.io')(server)


plugio = io.of '/plugins'

plugio.on 'connection', (socket) ->
  console.log 'plugin of connected'
  plugins socket

  socket.on 'system:notification', (data) ->
    io.emit 'system:notification', data

io.set 'authorization', (handshake, cb) ->
  return unless handshake._query?.token?
  token = handshake._query.token
  tungsten.decode token, config.token.secret, (err, data) ->
    return cb null, false if err?
    cb null, true


io.on 'connection', (socket) ->
  console.log 'connected'

  module.exports.socket = socket

  ###
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
  ###

  socket.on 'test', (data) ->
    console.log 'test worked', data
    socket.emit 'test', test: 'that'

module.exports = io
