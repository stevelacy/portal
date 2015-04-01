{model} = require 'fission'

sync = require './sync'

module.exports = model
  props:
    name: 'string'
    style: 'string'
    description: 'string'
    widget:
      activated: 'boolean'
      html: 'string'
      size: 'string'
      minimized: 'boolean'
    _id: 'string'
  url: '/v1/widgets'
  idAttribute: '_id'
  sync: sync
