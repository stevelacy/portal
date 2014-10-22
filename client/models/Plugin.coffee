fission = require '../app'

module.exports = fission.model
  props:
    name: 'string'
    _id: 'string'
    content: 'string'
  url: '/v1/plugins'
