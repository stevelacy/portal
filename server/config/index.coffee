_ = require 'lodash'
{join} = require 'path'
{argv} = require 'optimist'
env = argv.env or process.env.NODE_ENV or 'development'

configWithEnv = require "./#{env}"
configDefault = require './default'
logFile = join __dirname, "#{env}.log"

config = _.merge configDefault, configWithEnv

config.logFile = logFile
config.env = env
config.port = process.env.PORT or config.port
config.database = config.database or process.env.MONGO_URL
config.pubdir = join __dirname, '../../public'

module.exports = config
