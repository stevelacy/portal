{Schema} = require 'mongoose'

Model = new Schema

  name:
    type: String
  token:
    type: String
  description:
    type: String
  html:
    type: String
  script:
    type: String
  path:
    type: String
  main:
    type: String
  activated:
    type: Boolean
    default: false
  id:
    type: String
    select: false
  size:
    type: String
    default: 'medium'
  minimized:
    type: Boolean
    default: false

Model.set 'toJSON', getters: true, virtuals: true
Model.set 'toObject', getters: true, virtuals: true

module.exports = Model
