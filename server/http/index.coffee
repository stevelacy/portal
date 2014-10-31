http = require 'http'
config = require '../config'

app = require './express'

# handle auth on incoming requests
auth = require './passport'
#twitter = require './passport/twitter'
#google = require './passport/google'
#facebook = require './passport/facebook'
local = require './passport/local'

# serve our APIs
apis = require './apis'

# catch-all serve index.html
spa = require './express/spa'

sockets = require './sockets'

httpServer = require './httpServer'


module.exports = httpServer
