config = require '../../config'
db = require '../../db'
log = require '../../lib/log'
{Plugin} = db.models

module.exports = (socket) ->

  Plugin.find activated: true, (err, plugins) ->
    return log.error err if err?
    if plugins[0]
      for k, plugin of plugins
        if plugin.main?
          try
            runPlugin = require "#{config.plugins.path}/#{plugin.name}/#{plugin.main}"
            runPlugin socket, plugin
          catch e
            log.error e
