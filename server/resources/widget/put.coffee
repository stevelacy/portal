isObjectId = require '../../lib/isObjectId'
db = require '../../db'
Plugin = db.model 'Plugin'

module.exports = (req, res, next) ->
  return res.status(403).end() unless req.isAuthenticated()
  return next new Error 'Invalid body' unless typeof req.body is 'object'

  q = Plugin.findOne req.params.name
  q.exec (err, plugin) ->
    return next err if err?

    plugin.set req.body

    plugin.save (err, plugin) ->
      console.log plugin, 'put'
      return next err if err?
      res.send plugin.toJSON()
