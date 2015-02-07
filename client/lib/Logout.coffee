{view} = require 'fission'

module.exports = view
  statics: willTransitionTo: (tr) ->
    window.localStorage.removeItem 'token'
    tr.redirect 'login'
  render: -> null
