path = require 'path'
express = require 'express'
compress = require 'compression'
methodOverride = require 'method-override'
cookieParser = require 'cookie-parser'
errorHandler = require 'errorhandler'
bodyParser = require 'body-parser'
staticFiles = require 'serve-static'
tungsten = require 'tungsten'
cors = require 'cors'

config = require '../../config'
log = require '../../lib/log'

tungstenAuth = require './tungsten'

app = express()
app.disable 'x-powered-by'


app.use errorHandler()
app.use compress()
app.use methodOverride()
app.use bodyParser.json strict: true
app.use cookieParser config.cookieSecret
app.use express.static config.pubdir
app.use '/static/', express.static config.plugins.path


app.use (err, req, res, next) ->
  log.error err.stack
  res.send 500, 'Something broke!'

app.use cors()

app.use log.middleware.init()
app.use log.middleware.log()

app.all '*', [tungstenAuth], (req, res, next) ->
  next()

module.exports = app
