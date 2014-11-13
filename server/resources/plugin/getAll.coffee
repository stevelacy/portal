async = require 'async'
fs = require 'fs'
path = require 'path'
config = require '../../config'
log = require '../../lib/log'
db = require '../../db'
Plugin = db.model 'Plugin'


setPlugin = (json, cb) ->
  Plugin.findOne name: json.name, (err, plugin) ->
    data = json.portal
    data.name = json.name
    data.description = json.description
    if plugin
      plugin.set data
      plugin.save (err, doc) ->
        return cb err if err?
        return cb null, doc
    else
      plug = new Plugin data
      plug.save (err, doc) ->
        return cb err if err?
        return cb null, doc

module.exports = (req, res, next) ->
  return res.status(403).end() unless req.user?

  plugins = []
  fs.readdir config.plugins.path, (err, paths) ->

    async.forEach paths, (item, cb) ->
      pth = "#{config.plugins.path}/#{item}"
      if fs.statSync(pth).isDirectory()
        pth = "#{pth}/package.json"
        if fs.existsSync pth
          try
            #json = require pth
            file = fs.readFileSync pth
            json = JSON.parse file
            setPlugin json, (err, data) ->
              log.error err if err?
              return cb err if err?
              plugins.push data
              return cb()
          catch e
            log.error e

    , (err) ->
      return res.status(500).send err if err?
      return res.status(200).json plugins
