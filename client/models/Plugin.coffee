fission = require '../app'

module.exports = fission.model
  props:
    name: 'string'
    main: 'string'
    html: 'string'
    style: 'string'
    description: 'string'
    activated: 'boolean'
    token: 'string'
    widget:
      activated: 'boolean'
    _id: 'string'
  url: '/v1/plugins'
  idAttribute: '_id'
