{Schema} = require 'mongoose'

Plugin = new Schema

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

Plugin.set 'toJSON', {getters:true, virtuals:true}
Plugin.set 'toObject', {getters:true, virtuals:true}

module.exports = Plugin
