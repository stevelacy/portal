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

app.use log.middleware

app.all '*', [tungstenAuth], (req, res, next) ->
  diff = process.hrtime req._startAt
  ms = diff[0] * 1e3 + diff[1] * 1e-6
  ms = ms.toFixed(3)
  res.setHeader 'X-Response-Time', ms
  log.info "#{req.method} #{req.originalUrl} - #{ms}ms"
  next()

module.exports = app
