setup = require '../setup'
app = require '../../'
config = require '../../config'
db = require '../../db'

User = db.model 'User'
Plugin = db.model 'Plugin'

request = require 'supertest'
should = require 'should'

mock = setup.user
mockPlug = setup.plugin

describe 'Plugin GET plural', ->
  beforeEach db.wipe
  beforeEach (cb) ->
    User.create mock, (err, user) ->
      cb err, user if err?
      Plugin.create mockPlug, cb

  it 'should respond with 403 when not logged in', (done) ->
    request(app)
      .get "#{config.apiPrefix}/plugins"
      .set 'Accept', 'application/json'
      .expect(403, done)

  it 'should respond with 200 and information when logged in', (done) ->
    request(app)
      .get "#{config.apiPrefix}/plugins"
      .set 'Accept', 'application/json'
      .query token: mock.token
      .expect 'Content-Type', /json/
      .expect 200
      .end (err, res) ->
        return done err if err?
        should.exist res.body
        Array.isArray(res.body).should.equal true
        res.body.length.should.equal 1
        done()
