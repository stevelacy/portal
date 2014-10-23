server = require '../httpServer'
io = require('socket.io')(server)


io.on 'connection', (socket) ->
  console.log 'connected'

  socket.on 'test', (data) ->
    console.log 'test worked'


module.exports = io
