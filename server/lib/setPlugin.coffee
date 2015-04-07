db = require '../db'
{Plugin} = db.models

module.exports = (json, cb) ->
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
