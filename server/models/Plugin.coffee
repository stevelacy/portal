{Schema} = require 'mongoose'
formatFields = require 'mongoose-format-fields'

Model = new Schema

  name:
    type: String
    grants: ['admin']

  token:
    type: String
    grants: ['admin']

  description:
    type: String
    grants: ['admin']

  html:
    type: String
    grants: ['admin']

  config:
    type: String
    grants: ['admin']

  script:
    type: String
    grants: ['admin']

  path:
    type: String
    grants: ['admin']

  main:
    type: String
    grants: ['admin']

  activated:
    type: Boolean
    default: false
    grants: ['admin']

  id:
    type: String
    select: false
    grants: ['admin']

  size:
    type: String
    default: 'medium'
    grants: ['admin']

  minimized:
    type: Boolean
    default: false
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
