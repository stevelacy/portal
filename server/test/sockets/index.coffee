should = require 'should'
client = require 'socket.io-client'
socketIo = require 'socket.io'

config = require '../../config'
io = require '../../http/sockets'

setup = require '../setup'
db = require '../../db'
User = db.model 'User'

mock = setup.user

describe 'socket core', ->

  beforeEach db.wipe
  beforeEach (cb) ->
    User.create mock, cb

  it 'should expose a socket instance', (done) ->
    io.should.be.instanceOf socketIo
    done()

  it 'should not accept an unauthorized connection without a token', (done) ->
    client1 = client.connect config.url

    client1.on 'error', (err) ->
      err.should.equal 'Not authorized'
      client1.disconnect()
      done()

  it 'should accept a connection from an authorized user', (done) ->
    client1 = client.connect config.url,
      query: "token=#{mock.token}"

    client1.on 'connect', ->
      done()
