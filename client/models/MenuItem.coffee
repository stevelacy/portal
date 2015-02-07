{model} = require 'fission'

sync = require './sync'

module.exports = model
  props:
    page: 'string'
    name: 'string'
    status: 'string'
    _id: 'string'
  url: '/v1/menuitems'
  idAttribute: '_id'
  sync: sync
