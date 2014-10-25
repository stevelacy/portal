{Schema} = require 'mongoose'

Model = new Schema

  name:
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
  widget:
    script:
      type: String
    html:
      type: String
    activated:
      type: Boolean
      default: false
    size:
      type: String
  id:
    type: String
    select: false

Model.set 'toJSON', {getters:true, virtuals:true}
Model.set 'toObject', {getters:true, virtuals:true}

module.exports = Model
