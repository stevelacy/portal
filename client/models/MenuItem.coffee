{model} = require 'fission'

sync = require './sync'

module.exports = model
  urlRoot: '/v1/menuitems'
  sync: sync
  props:
    id: 'string'
    page: 'string'
    name: 'string'
    status: 'string'
