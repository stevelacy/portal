isObjectId = require '../../lib/isObjectId'
db = require '../../db'
{Plugin} = db.models

module.exports = (req, res, next) ->
  return res.status(403).end() unless req.user?

  # return all
  q = Plugin.find activated: true, widget: $ne: null
  q.limit 25

  q.exec (err, widgets) ->
    return next err if err?
    res.status(200).json widgets
