tungsten = require 'tungsten'
config = require '../../config'
db = require '../../db'
{Plugin} = db.models


module.exports = (req, res) ->
  return res.end() unless req.params?.plugin and req.params.route
  token = null
  token ?= req.headers['x-access-token']
  token ?= req.body?.token
  return res.end() unless token?
  tungsten.decode token, config.token.secret, (err, decoded) ->
    return res.end() if err?
    return res.end() unless decoded?

    Plugin.findOne name: req.params.plugin, (err, plugin) ->
      return res.end() if err?
      return res.end() unless plugin?.name is decoded.name
      runPlugin = require "#{config.plugins.path}/#{plugin.name}/#{plugin.main}"
      return res.end() unless typeof runPlugin.http is 'function'
      runPlugin.http route: req.params.route, body: req.body, (err, data) ->
        return res.end() if err?
        res.status(200).send data
