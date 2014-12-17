{join} = require 'path'

module.exports =
  database: 'mongodb://localhost:27017/portal-test'
  mongo:
    url: 'mongodb://127.0.0.1:27017/portal-test'
    host: '127.0.0.1'
    port: 27017
    name: 'porttal'
  token:
    secret: 'IhoiUHyu6gtghj'

  debug: false
  twitter:
    consumerKey: 'fake'
    consumerSecret: 'secret'
    callback: '/auth/twitter/callback'

  facebook:
    clientID: 'such'
    clientSecret: 'secret'
    callback: '/auth/facebook/callback'

  google:
    callback: '/auth/google/callback'
    clientId: '81350635eusercontent.com'
    clientSecret: 'N3s7'
    apiKey: 'ekY'
  plugins:
    path: join __dirname, '../../server/test/fixtures/plugins'
