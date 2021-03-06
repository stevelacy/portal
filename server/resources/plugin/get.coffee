path = require 'path'
fs = require 'fs'
isObjectId = require '../../lib/isObjectId'
db = require '../../db'
{Plugin} = db.models

module.exports = (req, res, next) ->
  return res.status(403).end() unless req.user?
  return next new Error('Invalid id parameter') unless typeof req.params.id is 'string'

  if isObjectId req.params.id
    # look up by db id
    q = Plugin.findById req.params.id
  else
    # look up by plugin name
    q = Plugin.findOne name: req.params.id

  q.exec (err, plugin) ->
    return next err if err?
    return res.status(404).end() unless plugin?

    if plugin.html?
      plugin.html = "/static/#{plugin.name}/#{plugin.html}"
    else
      plugin.html = 'ERROR: no template found'

    if plugin.config?
      plugin.config = "/static/#{plugin.name}/#{plugin.config}"
    else
      plugin.html = 'ERROR: no template found'

    if plugin.main?
      plugin.main =  "/static/#{plugin.name}/#{plugin.main}"
    else
      plugin.main = 'ERROR: no script found'

    res.status(200).json plugin.format [req.user.role]
