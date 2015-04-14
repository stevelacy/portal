{model} = require 'fission'

sync = require './sync'

module.exports = model
  props:
    name: 'string'
    main: 'string'
    html: 'string'
    style: 'string'
    description: 'string'
    activated: 'boolean'
    token: 'string'
    activated: 'boolean'
    html: 'string'
    config: 'string'
    size: 'string'
    minimized: 'boolean'
    _id: 'string'
  url: '/v1/plugins'
  idAttribute: '_id'
  sync: sync
