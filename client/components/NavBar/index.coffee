{component, DOM, Link} = require 'fission'

{header, h1, img, a, div, span, p, button} = DOM

module.exports = component
  render: ->
    @props?.color ?= 'light'
    @props?.background ?= ''

    style =
      className: "navbar component #{@props?.color} #{@props?.background}"

    div style,
      div className: 'logo',
        Link to: '/', window._config.name
      div className: 'right'
