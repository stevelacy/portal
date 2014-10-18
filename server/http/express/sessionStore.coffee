sessionstore = require "sessionstore"
config = require "../../config"

module.exports = sessionstore.createSessionStore
  type: "mongoDb"
  host: config.mongo.host
  port: config.mongo.port
  dbName: config.mongo.name
  collectionName: "sessions"
