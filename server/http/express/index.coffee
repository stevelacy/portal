path = require 'path'
express = require 'express'
compress = require 'compression'
methodOverride = require 'method-override'
cookieParser = require 'cookie-parser'
responseTime = require 'response-time'
errorHandler = require 'errorhandler'
bodyParser = require 'body-parser'
staticFiles = require 'serve-static'
session = require 'express-session'

config = require '../../config'
sessionStore = require "./sessionStore"
log = require '../../lib/log'


app = express()
app.disable 'x-powered-by'


app.use errorHandler()
app.use responseTime()
app.use compress()
app.use methodOverride()
app.use bodyParser.json strict: true
app.use cookieParser config.cookieSecret
app.use express.static config.pubdir

app.use '/static/', express.static config.plugins.path

app.use session
  store: sessionStore
  key: config.cookieName
  secret: config.cookieSecret
  cookie:
    maxAge: 31536000000

app.use (err, req, res, next) ->
  log.error err.stack
  res.send 500, 'Something broke!'

app.get '*' , (req, res, next) ->
  log.info route: req.originalUrl, method: req.method, 'route called'
  next()

module.exports = app
