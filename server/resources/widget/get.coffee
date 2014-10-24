isObjectId = require '../../lib/isObjectId'
db = require '../../db'
Plugin = db.model 'Plugin'

module.exports = (req, res, next) ->
  #return res.status(403).end() unless req.isAuthenticated()
  return next new Error('Invalid id parameter') unless typeof req.params.id is 'string'

  if isObjectId req.params.id
    # look up by db id
    q = Plugin.findById req.params.id

  else
    # look up by name
    q = Plugin.findOne name: req.params.id


  q.exec (err, plugin) ->
    return next err if err?
    return res.status(404).end() unless plugin?

    plugin = plugin.toJSON()

    res.status(200).json plugin
