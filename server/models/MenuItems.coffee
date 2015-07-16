{Schema} = require 'mongoose'
formatFields = require 'mongoose-format-fields'

Model = new Schema

  name:
    type: String
    grants: ['admin']

  page:
    type: String
    grants: ['admin']

  status:
    type: String
    grants: ['admin']

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
