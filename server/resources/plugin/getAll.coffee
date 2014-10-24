path = require 'path'
vinyl = require 'vinyl-fs'
map = require 'map-stream'
config = require '../../config'
db = require '../../db'
Plugin = db.model 'Plugin'

module.exports = (req, res, next) ->
  return res.status(403).end() unless req.isAuthenticated()


  plugins = []
  vinyl.src [ path.join(__dirname, "../../../#{config.plugins.path}/**/package.json")]
  .pipe map (file, cb) ->
    try
      json = require file.path
      if json.portal?
        Plugin.findOne name: json.name, (err, plugin) ->
          cb err if err?
          data =
            name: json.name
            main: json.portal?.main
            script: json.portal?.script
            html: json.portal?.html
            activated: plugin?.activated or false
            _id: plugin?._id or null
            description: json?.description
          plugins.push data
      cb null, file
    catch e
      cb e
  .on 'end', ->
    return res.status(200).json plugins
