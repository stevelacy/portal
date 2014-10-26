{Schema} = require 'mongoose'

Model = new Schema

  name:
    type: String
  page:
    type: String
  status:
    type: String

Model.set 'toJSON', {getters:true, virtuals:true}
Model.set 'toObject', {getters:true, virtuals:true}

module.exports = Model
