should = require 'should'
client = require 'socket.io-client'
socketIo = require 'socket.io'

config = require '../../config'
io = require '../../http/sockets'
app = require '../../'

setup = require '../setup'
db = require '../../db'
User = db.model 'User'

user = setup.user

describe 'socket auth', ->
  beforeEach db.wipe
  beforeEach (cb) ->
    User.create user, cb

  it 'should not accept an unauthorized connection without a token', (done) ->
    client1 = client.connect config.url,
      'force new connection': true

    client1.on 'error', (err) ->
      err.should.equal 'Not authorized'
      client1.disconnect()
      done()

  it 'should not accept an unauthorized connection with a null token', (done) ->
    client1 = client.connect config.url,
      'force new connection': true
      query: 'token='

    client1.on 'error', (err) ->
      err.should.equal 'Not authorized'
      client1.disconnect()
      done()

  it 'should not accept an unauthorized connection without a valid token', (done) ->
    client1 = client.connect config.url,
      'force new connection': true
      query: 'token=supdoge'

    client1.on 'error', (err) ->
      err.should.equal 'Not authorized'
      client1.disconnect()
      done()

  it 'should accept a connection from an authorized user', (done) ->
    client1 = client.connect config.url,
      'force new connection': true
      query: "token=#{user.token}"

    client1.on 'connect', ->
      client1.disconnect()
      done()
