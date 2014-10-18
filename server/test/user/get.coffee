setup = require '../setup'
app = require '../../start'
config = require '../../config'
db = require '../../db'

User = db.model 'User'

request = require 'supertest'
should = require 'should'
require 'mocha'

mock = require './mock'

describe 'User GET', ->
  beforeEach db.wipe
  beforeEach (cb) ->
    User.create mock, cb

  it 'should respond with 200 and information when logged in', (done) ->
    request(app)
      .get("#{config.apiPrefix}/users/#{mock._id}")
      .set('Accept', 'application/json')
      .query(setup.user.createQuery(mock._id))
      .expect('Content-Type', /json/)
      .expect(200)
      .end (err, res) ->
        return done err if err?
        should.exist res.body
        res.body.should.be.type 'object'
        res.body._id.should.equal mock._id
        done()

  it 'should respond with 200 and information when not logged in', (done) ->
    request(app)
      .get("#{config.apiPrefix}/users/#{mock._id}")
      .set('Accept', 'application/json')
      .expect('Content-Type', /json/)
      .expect(200)
      .end (err, res) ->
        return done err if err?
        should.exist res.body
        res.body.should.be.type 'object'
        res.body._id.should.equal mock._id
        should.not.exist res.body.token, 'should not show user token'
        done()

  it 'should respond with 200 and information when logged in with username query', (done) ->
    request(app)
      .get("#{config.apiPrefix}/users/#{mock.username}")
      .set('Accept', 'application/json')
      .query(setup.user.createQuery(mock._id))
      .expect('Content-Type', /json/)
      .expect(200)
      .end (err, res) ->
        return done err if err?
        should.exist res.body
        res.body.should.be.type 'object'
        res.body._id.should.equal mock._id
        done()

  it 'should respond with 200 and information when not logged in with username query', (done) ->
    request(app)
      .get("#{config.apiPrefix}/users/#{mock.username}")
      .set('Accept', 'application/json')
      .expect('Content-Type', /json/)
      .expect(200)
      .end (err, res) ->
        return done err if err?
        should.exist res.body
        res.body.should.be.type 'object'
        res.body._id.should.equal mock._id
        done()
