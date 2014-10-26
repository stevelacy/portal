isObjectId = require '../../lib/isObjectId'
db = require '../../db'
MenuItems = db.model 'MenuItems'

module.exports = (req, res, next) ->
  return res.status(403).end() unless req.isAuthenticated()

  # return all
  q = MenuItems.find()
  q.limit 25

  q.exec (err, items) ->
    return next err if err?
    res.status(200).json items
