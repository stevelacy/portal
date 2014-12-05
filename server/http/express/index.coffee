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
jwt = require 'jwt-simple'
cors = require 'cors'

config = require '../../config'
log = require '../../lib/log'

jwtAuth = require './jwt'

app = express()
app.disable 'x-powered-by'


app.use errorHandler()
app.use responseTime()
app.use compress()
app.use methodOverride()
app.use bodyParser()
app.use cookieParser config.cookieSecret
app.use express.static config.pubdir
app.set 'jwtTokenSecret', config.jwt.secret
app.use '/static/', express.static config.plugins.path


app.use (err, req, res, next) ->
  log.error err.stack
  res.send 500, 'Something broke!'

app.use cors()


app.all '*', [jwtAuth], (req, res, next) ->
  log.info route: req.originalUrl, method: req.method
  next()

module.exports = app
