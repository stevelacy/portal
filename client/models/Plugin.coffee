{model} = require 'fission'

sync = require './sync'

module.exports = model
  urlRoot: '/v1/plugins'
  sync: sync
  props:
    id: 'string'
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
