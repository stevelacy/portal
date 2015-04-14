tungsten = require 'tungsten'
config = require '../../config'
isObjectId = require '../../lib/isObjectId'
db = require '../../db'
{Plugin} = db.models

canModify = ['name', 'activated', 'minimized']

module.exports = (req, res, next) ->
  return res.status(403).end() unless req.user?
  return next new Error 'Invalid id parameter' unless isObjectId req.params.id
  return next new Error 'Invalid body' unless typeof req.body is 'object'

  # dont allow modification of reserved fields
  # canModify is the whitelist here
  delete req.body[k] for k,v of req.body when canModify.indexOf(k) is -1

  q = Plugin.findById req.params.id
  q.exec (err, plugin) ->
    return next err if err?
    return next() unless plugin?
    plugin.set req.body
    if req.body.activated
      tk =
        id: plugin._id
        name: plugin.name
      tungsten.encode tk, config.token.secret, (err, token) ->
        return next err if err?
        plugin.set token: token
        plugin.save (err, data) ->
          return next err if err?
          res.status(200).json plugin
    if !req.body.activated
      plugin.set token: undefined
      plugin.save (err, data) ->
        return next err if err?
        res.status(200).json plugin
