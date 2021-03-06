setup = require '../setup'
app = require '../../'
config = require '../../config'
db = require '../../db'

{User, Plugin} = db.models

request = require 'supertest'
should = require 'should'
require 'mocha'

mock = setup.user
mockPlug = setup.plugin

describe 'Plugin PATCH', ->
  beforeEach db.wipe
  beforeEach (cb) ->
    User.create mock, (err, user) ->
      cb err, user if err?
      Plugin.create mockPlug, cb

  it 'should respond with 403 when not logged in', (done) ->
    request(app)
      .patch "#{config.apiPrefix}/plugins/123"
      .set 'Accept', 'application/json'
      .expect 403, done

  it 'should respond with 200 and information when logged in', (done) ->
    mod =
      name: 'newplug'

    request(app)
      .patch "#{config.apiPrefix}/plugins/#{mockPlug._id}"
      .set 'Accept', 'application/json'
      .query token: mock.token
      .send mod
      .expect 'Content-Type', /json/
      .expect 200
      .end (err, res) ->
        return done err if err?
        should.exist res.body
        res.body.should.be.type 'object'
        res.body.id.should.equal mockPlug._id
        res.body.name.should.equal 'newplug'
        done()
