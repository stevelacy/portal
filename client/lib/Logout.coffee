{component} = require 'fission'

module.exports = component
  statics: willTransitionTo: (tr) ->
    window.localStorage.removeItem 'token'
    tr.redirect 'login'
  render: -> null
