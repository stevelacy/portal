bunyan = require 'bunyan'
onFinished = require 'on-finished'
config = require '../config'

logger = bunyan.createLogger
  name: config.name

if config.env == 'testing'
  logger =
    info: -> return
    fatal: -> return


logger.middleware = ->
  return (req, res, next) ->
    initial = process.hrtime()
    logInfo =
      route: req.originalUrl
      method: req.method

    onFinished res, (err, req) ->
      diff = process.hrtime initial
      ms = diff[0] * 1e3 + diff[1] * 1e-6
      ms = ms.toFixed 3

      logInfo.delay = ms
      logInfo.status = req.statusCode

      logger.info logInfo

    next()

module.exports = logger
