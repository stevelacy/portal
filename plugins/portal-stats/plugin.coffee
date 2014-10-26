{spawn} = require 'child_process'

systemStats = require './systemStats'



module.exports = (socket) ->

  socket.emit 'test', test: 'widget'

  systemStats (err, stats) ->
    socket.emit 'graphs',
      stats
    console.log stats
  setInterval ->
    systemStats (err, stats) ->
      socket.emit 'graphs',
        stats
      console.log stats
  , 3000
