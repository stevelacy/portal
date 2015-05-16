setup = require '../setup'
app = require '../../'
config = require '../../config'
db = require '../../db'

{User, Plugin} = db.models

request = require 'supertest'
should = require 'should'

mock = setup.user
mockPlug = setup.plugin

describe 'Plugin GET plural', ->
  beforeEach db.wipe
  beforeEach (cb) ->
    User.create mock, cb

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

        should.exist res.body[0].main
        should.exist res.body[0].html
        should.equal res.body[0].main, 'index.js'
        Plugin.find {}, (err, plugins) ->
          should.exist plugins[0]
          should.equal plugins[0].main, 'index.js'
          done()
