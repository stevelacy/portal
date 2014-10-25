cookieParser = require 'cookie-parser'
passportSocketIO = require 'passport.socketio'
sessionStore = require '../express/sessionStore'
server = require '../httpServer'
config = require '../../config'
plugins = require '../plugins'
io = require('socket.io')(server)


io.set 'authorization', passportSocketIO.authorize
  cookieParser: cookieParser
  key: config.cookieName
  secret: config.cookieSecret
  store: sessionStore
  fail: (data, message, critical, accept) ->
    console.log 'io session failed'
    accept null, false
  success: (data, accept) ->
    console.log 'io session success'
    accept null, true




io.on 'connection', (socket) ->
  console.log 'connected'
  module.exports.socket = socket

  plugins socket

  socket.on 'test', (data) ->
    console.log 'test worked', data
    socket.emit 'test', test: 'that'


module.exports = io
