{Schema} = require 'mongoose'

noWrite = ->
  perms =
    read: true
    write: false
  return perms

hidden = ->
  perms =
    read: false
    write: false
  return perms

Model = new Schema

  name:
    type: String
    required: true
    authorize: noWrite

  id:
    type: String
    required: true
    index:
      unique: true
    authorize: noWrite

  token:
    type: String
    required: true
    select: true
    authorize: hidden

  tokenSecret:
    type: String
    select: true
    authorize: hidden

  image:
    type: String
    authorize: noWrite
    default: "https://si0.twimg.com/sticky/default_profile_images/default_profile_0_normal.png"

  banner:
    type: String
  username:
    type: String
    required: true
    index:
      unique: true
    authorize: noWrite

  description:
    type: String
    authorize: noWrite

  website:
    type: String
    authorize: noWrite

  location:
    type: String
    authorize: noWrite

  followers:
    type: Number
    default: 0
    authorize: noWrite

  verified:
    type: Boolean
    default: false
    authorize: noWrite

  online:
    type: Boolean
    default: false
    authorize: noWrite

  created:
    type: Date
    default: Date.now
    authorize: noWrite

  lastModified:
    type: Date
    default: Date.now
    authorize: noWrite

Model.set 'toJSON', {getters:true, virtuals:true}
Model.set 'toObject', {getters:true, virtuals:true}

Model.methods.authorize = (req) ->
  perms =
    read: true
    write: (req.user.username is @username)
    delete: false
  return perms

Model.statics.authorize = ->
  perms =
    read: true
    write: false
  return perms

Model.statics.me = (req, cb) ->
  cb null, req.user

Model.statics.byHandle = ({query}, cb) ->
  return cb new Error "Missing username parameter" unless typeof query.username is 'string' and query.username.length > 0
  @findOne {username:query.username}, cb

module.exports = Model
