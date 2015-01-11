fission = require '../../app'

{header, h1, img, a, div, span, p, button} = fission.React.DOM


View = fission.view
  render: ->
    @props?.color ?= 'light'
    @props?.background ?= ''

    style =
      className: "navbar #{@props?.color} #{@props?.background}"

    div style,
      div className: 'logo',
        a href: '/', fission.config.name
      div className: 'right'
module.exports = View
