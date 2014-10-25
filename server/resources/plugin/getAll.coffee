async = require 'async'
fs = require 'fs'
path = require 'path'
config = require '../../config'
log = require '../../lib/log'
db = require '../../db'
Plugin = db.model 'Plugin'


setPlugin = (json, cb) ->
  Plugin.findOne name: json.name, (err, plugin) ->
    if plugin
      return cb null, plugin
    else

      data = json.portal
      data.name = json.name
      data.description = json.description
      plug = new Plugin data

      plug.save (err, doc) ->
        return cb err if err?
        return cb null, doc
    ###

    cb err if err?
    data = json.portal
    data.name = json.name
    data.description = json.description
    data.activated = plugin?.activated or false
    if plugin?
      Plugin.update _id: plugin._id, data, (err, doc) ->
        return cb err if err?
        doc.id = undefined
        return cb null, doc
    else
    ###

module.exports = (req, res, next) ->
  return res.status(403).end() unless req.isAuthenticated()

  plugins = []
  fs.readdir config.plugins.path, (err, paths) ->

    async.forEach paths, (item, cb) ->
      pth = "#{config.plugins.path}/#{item}"
      if fs.statSync(pth).isDirectory()
        pth = "#{pth}/package.json"
        if fs.existsSync pth
          try
            json = require pth
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
