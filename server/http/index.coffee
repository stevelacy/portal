http = require 'http'
config = require '../config'

app = require './express'

# handle auth on incoming requests
auth = require './auth'

# serve our APIs
apis = require './apis'

sockets = require './sockets'

# catch-all serve index.html
spa = require './express/spa'

httpServer = require './httpServer'


module.exports = httpServer
