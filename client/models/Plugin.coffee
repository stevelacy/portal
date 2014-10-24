fission = require '../app'

module.exports = fission.model
  props:
    name: 'string'
    description: 'string'
    activated: 'boolean'
    _id: 'string'
    html: 'string'
    style: 'string'
  url: '/v1/plugins'
  idAttribute: '_id'
