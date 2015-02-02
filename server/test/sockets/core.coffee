should = require 'should'
client = require 'socket.io-client'
socketIo = require 'socket.io'

config = require '../../config'
io = require '../../http/sockets'
app = require '../../'

describe 'socket core', ->

  it 'should expose a socket instance', (done) ->
    io.should.be.instanceOf socketIo
    done()
