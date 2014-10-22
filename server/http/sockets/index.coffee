server = require '../httpServer'
io = require('socket.io')(server)


io.on 'connection', (socket) ->
  console.log 'connected'




module.exports = io
