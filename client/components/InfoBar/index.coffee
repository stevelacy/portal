{component, DOM} = require 'fission'

{div, h1} = DOM

module.exports = component
  displayName: 'InfoBar'
  render: ->
    div className: 'infobar component',
      h1 null, 'INFO'
