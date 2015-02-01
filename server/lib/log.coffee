bunyan = require 'bunyan'
config = require '../config'

logger = bunyan.createLogger
  name: config.name
if config.env == 'testing'
  logger =
    info: -> return
    fatal: -> return


module.exports = logger
