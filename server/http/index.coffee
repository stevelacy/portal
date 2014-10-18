http = require 'http'
config = require '../config'

app = require './express'

# handle auth on incoming requests
auth = require './passport'
twitter = require './passport/twitter'
#fbauth = require './passport/facebook'

# server our APIs
apis = require './apis'

# catch-all serve index.html
spa = require './express/spa'

httpServer = http.createServer app


module.exports = httpServer
