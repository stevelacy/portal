tungsten = require 'tungsten'
server = require '../httpServer'
config = require '../../config'
plugins = require '../plugins'
io = require('socket.io')(server)


plugio = io.of '/plugins'

plugio.on 'connection', (socket) ->
  plugins socket

  socket.on 'system:notification', (data) ->
    io.emit 'system:notification', data

io.set 'authorization', (handshake, cb) ->
  return cb null, false unless handshake._query?.token?
  token = handshake._query.token
  tungsten.decode token, config.token.secret, (err, data) ->
    return cb null, false if err?
    cb null, true


io.on 'connection', (socket) ->
  console.log 'connected'

  socket.on 'test', (data) ->
    console.log 'test worked', data
    socket.emit 'test', test: 'that'

module.exports = io
