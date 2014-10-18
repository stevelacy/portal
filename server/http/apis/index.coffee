config = require '../../config'
app = require '../express'
log = require '../../lib/log'
pluralize = require 'pluralize'

requireDir = require 'require-dir'
path = require 'path'
resDir = path.join __dirname, '../../resources'
resources = requireDir resDir, recurse: true

registerRoute = (method, route, fns...) ->
  log.info "#{method.toUpperCase()} #{route} registered"
  app[method] route, fns...
  return app

# Actual APIs
for resource, handlers of resources
  for method, fn of handlers when typeof fn is 'function'
    pluralized = pluralize.plural resource
    if method is 'getAll' # special case for plurals
      registerRoute 'get', "#{config.apiPrefix}/#{pluralized}", fn
    else if method is 'post'
      registerRoute method, "#{config.apiPrefix}/#{pluralized}", fn
    else
      registerRoute method, "#{config.apiPrefix}/#{pluralized}/:id", fn

module.exports = app
