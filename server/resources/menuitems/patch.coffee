isObjectId = require '../../lib/isObjectId'
db = require '../../db'
MenuItems = db.model 'MenuItems'

canModify = ['name', 'content']  ## Whitelist, what the user can modify

module.exports = (req, res, next) ->
  return res.status(403).end() unless req.isAuthenticated()


  return res.send(401).json error: 'not modifiable'



  return next new Error 'Invalid id parameter' unless isObjectId req.params.id
  return res.status(403).end() unless req.params.id is String(req.user._id)
  return next new Error 'Invalid body' unless typeof req.body is 'object'

  # dont allow modification of reserved fields
  # canModify is the whitelist here
  delete req.body[k] for k,v of req.body when canModify.indexOf(k) is -1

  q = MenuItems.findById req.params.id
  q.exec (err, user) ->
    return next err if err?

    user.set req.body

    user.save (err, nuser) ->
      return next err if err?
      res.status(200).json nuser.toJSON()
