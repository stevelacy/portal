fission = require '../app'

module.exports = fission.model
  props:
    name: 'string'
    style: 'string'
    description: 'string'
    widget:
      activated: 'boolean'
      html: 'string'
      size: 'string'
    _id: 'string'
  url: '/v1/widgets'
  idAttribute: '_id'
