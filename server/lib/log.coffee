bunyan = require 'bunyan'
config = require '../config'

logger = bunyan.createLogger
  name: config.name

if config.env == 'testing'
  logger =
    info: -> return
    fatal: -> return


logger.middleware =
  init: ->
    return (req, res, next) ->
      return if res._startAt?
      req._startAt = process.hrtime()
      req._startTime = new Date
      next()
  log: ->
    return (req, res, next) ->
      diff = process.hrtime req._startAt
      ms = diff[0] * 1e3 + diff[1] * 1e-6
      ms = ms.toFixed(3)
      res.setHeader 'X-Response-Time', ms
      logger.info
        route: req.originalUrl
        method: req.method
        delay: ms
        status: res.statusCode
      next()

module.exports = logger
