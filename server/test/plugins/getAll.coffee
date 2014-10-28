setup = require '../setup'
app = require '../../'
config = require '../../config'
db = require '../../db'

User = db.model 'User'
Plugin = db.model 'Plugin'

request = require 'supertest'
should = require 'should'
require 'mocha'

mock = require './mock'
mockPlug = require './mockPlug'

describe 'Plugin GET plural', ->
  beforeEach db.wipe
  beforeEach (cb) ->
    User.create mock, ->
      Plugin.create mockPlug, cb

  it 'should respond with 403 when not logged in', (done) ->
    request(app)
      .get("#{config.apiPrefix}/plugins")
      .set('Accept', 'application/json')
      .expect(403, done)

  it 'should respond with 200 and information when logged in', (done) ->
    request(app)
      .get("#{config.apiPrefix}/plugins")
      .set('Accept', 'application/json')
      .query(setup.user.createQuery(mock._id))
      .expect('Content-Type', /json/)
      .expect(200)
      .end (err, res) ->
        return done err if err?
        console.log res.body
        return done()
        should.exist res.body
        Array.isArray(res.body).should.equal true
        res.body.length.should.equal 1
        res.body[0]._id.should.equal mock._id
        done()
