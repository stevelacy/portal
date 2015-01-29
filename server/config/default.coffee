{join} = require 'path'

module.exports =
  port: 5000
  name: 'Quare'
  debug: true
  apiPrefix: '/v1'
  plugins:
    path: join __dirname, '../../plugins'
    namespace: 'plugins'
