{join} = require 'path'

module.exports =
  name: 'Quare'
  debug: true
  apiPrefix: '/v1'
  plugins:
    path: join __dirname, '../../plugins'
    namespace: 'plugins'
