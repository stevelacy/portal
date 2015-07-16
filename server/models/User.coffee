bcrypt = require 'bcrypt'
{Schema} = require 'mongoose'
formatFields = require 'mongoose-format-fields'


Model = new Schema

  role:
    grants: ['admin']
    type: String
    enum: ['admin', 'user']
    default: 'admin'

  name:
    type: String
    required: true
    grants: ['admin']

  email:
    type: String
    required: true
    index:
      unique: true
    grants: ['admin']

  username:
    type: String
    grants: ['admin']

  password:
    type: String
    required: true
    grants: ['admin']

  token:
    type: String
    grants: ['admin']

  image:
    type: String
    default: '/img/user.png'
    grants: ['admin']


  online:
    type: Boolean
    default: false
    grants: ['admin']

  created:
    type: Date
    default: Date.now
    grants: ['admin']

  lastModified:
    type: Date
    default: Date.now
    grants: ['admin']


Model.pre 'save', (next) ->
  return next() unless @.isModified 'password'
  bcrypt.genSalt 10, (err, salt) =>
    return next err if err?
    bcrypt.hash @password, salt, (err, hash) =>
      return next err if err?
      @password = hash
      next()


Model.methods.comparePassword = (password, cb) ->
  bcrypt.compare password, @password, (err, match) ->
    return cb err if err?
    cb null, match

Model.set 'toJSON',
  getters: true
  virtuals: true

Model.set 'toObject',
  getters: true
  virtuals: true
Model.set 'strict', true

Model.set 'id_grants', 'public'
Model.set 'id_output', 'id'
Model.plugin formatFields

module.exports = Model
