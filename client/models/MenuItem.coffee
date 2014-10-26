fission = require '../app'

module.exports = fission.model
  props:
    page: 'string'
    name: 'string'
    status: 'string'
    _id: 'string'
  url: '/v1/menuitems'
  idAttribute: '_id'
