isObjectId = require '../../lib/isObjectId'
db = require '../../db'
{Plugin} = db.models

module.exports = (req, res, next) ->
  return res.status(403).end() unless req.user?
  return next new Error 'Invalid id parameter' unless isObjectId req.params.id
  return next new Error 'Invalid body' unless typeof req.body is 'object'

  q = Plugin.findById req.params.id, (err, plugin) ->
    return next err if err?
    delete req.body._id # prevent MongoError on changing _id
    plugin.set req.body

    plugin.save (err, plugin) ->
      console.log 'put'
      return next err if err?
      res.send plugin.toJSON()
