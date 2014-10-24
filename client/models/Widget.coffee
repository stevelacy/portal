fission = require '../app'

module.exports = fission.model
  props:
    name: 'string'
    main: 'string'
    html: 'string'
    style: 'string'
    widget:
      activated: 'boolean'
    _id: 'string'
  url: '/v1/widgets'
  idAttribute: '_id'
