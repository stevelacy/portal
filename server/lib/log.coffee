bunyan = require 'bunyan'
config = require '../config'

logger = bunyan.createLogger
  name: config.name

if config.env == 'testing'
  logger =
    info: -> return
    fatal: -> return


logger.middleware = (req, res, next) ->
  return if res._startAt?
  req._startAt = process.hrtime()
  req._startTime = new Date
  return next()

module.exports = logger
