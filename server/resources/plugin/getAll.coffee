async = require 'async'
fs = require 'fs'
path = require 'path'
db = require '../../db'
log = require '../../lib/log'
config = require '../../config'
setPlugin = require '../../lib/setPlugin'
{Plugin} = db.models

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
      return res.status(200).json plugins.map (plugin) ->
        plugin.format [req.user.role]
