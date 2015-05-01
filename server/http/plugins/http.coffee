config = require '../../config'
db = require '../../db'
{Plugin} = db.models


module.exports = (req, res) ->
  return unless req.params?.plugin and req.params.route
  Plugin.findOne name: req.params.plugin, (err, plugin) ->
    return res.end() if err?
    return res.end() unless plugin?
    runPlugin = require "#{config.plugins.path}/#{plugin.name}/#{plugin.main}"
    return res.end() unless typeof runPlugin.http is 'function'
    runPlugin.http route: req.params.route, body: req.body
    res.end()
