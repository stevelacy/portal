{join} = require 'path'

module.exports =
  cache: true
  database: 'mongodb://'
  twitter:
    consumerKey: ''
    secretKey: ''
    callback: '/auth/twitter/callback'
