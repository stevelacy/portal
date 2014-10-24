spawn = require('child_process').spawn

systemStats = require './systemStats'



module.exports = (socket) ->

  socket.emit 'test', test: 'that'
  socket.on 'test', (data) ->

    systemStats (err, stats) ->
      socket.emit 'graphs',
        stats
    setInterval ->
      systemStats (err, stats) ->
        socket.emit 'graphs',
          stats
    , 3000
