isObjectId = require '../../lib/isObjectId'
db = require '../../db'
Plugin = db.model 'Plugin'

canModify = ['name', 'activated']

module.exports = (req, res, next) ->
  return res.status(403).end() unless req.isAuthenticated()
  return next new Error 'Invalid id parameter' unless isObjectId req.params.id
  return next new Error 'Invalid body' unless typeof req.body is 'object'

  # dont allow modification of reserved fields
  # canModify is the whitelist here
  delete req.body[k] for k,v of req.body when canModify.indexOf(k) is -1

  q = Plugin.findById req.params.id
  q.exec (err, plugin) ->
    return next err if err?

    console.log plugin, 'plugin'
    plugin.set req.body

    plugin.save (err, plugin) ->
      console.log err, plugin, 'put'
      return next err if err?
      res.send plugin.toJSON()
