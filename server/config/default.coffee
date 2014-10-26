{join} = require 'path'

module.exports =
  port: 5000
  name: 'Quare'
  cookieName: 'hash.sid'
  cookieSecret: 'e333f42577d541802d8a3a2372981bfcsportsaretitee333f42577d541802d8a3a2372981bfc'
  debug: true
  apiPrefix: '/v1'
  plugins:
    path: join __dirname, '../../plugins'
