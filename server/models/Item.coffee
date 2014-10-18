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

Item = new Schema

  name:
    type: String

  content:
    type: String

Item.set 'toJSON', {getters:true, virtuals:true}
Item.set 'toObject', {getters:true, virtuals:true}

Item.methods.authorize = (req) ->
  perms =
    read: true
    write: (req.user.username is @username)
    delete: false
  return perms

Item.statics.authorize = ->
  perms =
    read: true
    write: false
  return perms

module.exports = Item
