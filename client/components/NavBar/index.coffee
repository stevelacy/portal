{component, DOM, Link, classes} = require 'fission'

{header, h1, img, a, div, span, p, button} = DOM

module.exports = component
  displayName: 'NavBar'
  render: ->

    style =
      className: classes 'navbar-component', @props.color

    div style,
      div className: 'logo',
        Link to: '/', window._config.name
      div className: 'right'
