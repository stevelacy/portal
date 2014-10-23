fission = require '../app'

module.exports = fission.model
  props:
    name: 'string'
    description: 'string'
    activated: 'boolean'
    _id: 'string'
    html: 'string'
  url: '/v1/plugins'
