isObjectId = require '../../lib/isObjectId'
db = require '../../db'
Plugin = db.model 'Plugin'


module.exports = (req, res, next) ->
  return res.status(403).end() unless req.user?
  return next new Error 'Invalid body' unless typeof req.body is 'object'

  console.log req.body, 'post'
  return res.status(200).send 'test'

  item = new Plugin req.body
  item.save (err, data) ->
    return res.status(500).send error: "item not created" if err?
    return res.status(200).send status: data
