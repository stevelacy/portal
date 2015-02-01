{join} = require 'path'

module.exports =
  url: 'http://127.0.0.1:5000'
  database: 'mongodb://localhost:27017/portal-test'
  mongo:
    url: 'mongodb://127.0.0.1:27017/portal-test'
    host: '127.0.0.1'
    port: 27017
    name: 'porttal'
  token:
    secret: 'IhoiUHyu6gtghj'

  debug: false
  plugins:
    path: join __dirname, '../../server/test/fixtures/plugins'
