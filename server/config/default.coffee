{join} = require 'path'

module.exports =
  name: 'P.O.R.T.A.L'
  debug: true
  apiPrefix: '/v1'
  plugins:
    path: join __dirname, '../../plugins'
    namespace: 'plugins'
