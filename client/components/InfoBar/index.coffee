{component, DOM} = require 'fission'

{div, h1} = DOM

module.exports = component
  render: ->
    div className: 'infobar',
      h1 null, 'INFO'
