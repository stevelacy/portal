setup = require '../setup'
app = require '../../'
config = require '../../config'
db = require '../../db'

User = db.model 'User'
Plugin = db.model 'Plugin'

request = require 'supertest'
should = require 'should'
require 'mocha'

mock = setup.user
mockPlug = setup.plugin

describe 'Plugin GET', ->
  beforeEach db.wipe
  beforeEach (cb) ->
    User.create mock, (err, user) ->
      cb err, user if err?
      Plugin.create mockPlug, cb

  it 'should respond with 200 and information when logged in', (done) ->

    request(app)
      .get "#{config.apiPrefix}/plugins/#{mockPlug._id}"
      .set 'Accept', 'application/json'
      .query token: mock.token
      .expect 'Content-Type', /json/
      .expect 200
      .end (err, res) ->
        console.log err
        return done err if err?
        should.exist res.body
        res.body.should.be.type 'object'
        res.body._id.should.equal mockPlug._id
        done()

  it 'should respond with 403 and information when not logged in', (done) ->
    request(app)
      .get("#{config.apiPrefix}/plugins/#{mockPlug._id}")
      .set('Accept', 'application/json')
      .expect(403)
      .end (err, res) ->
        return done err if err?
        should(Object.keys(res.body).length).equal 0
        done()
