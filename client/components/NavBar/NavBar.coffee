fission = require '../../app'
ProfilePicView = require '../../components/ProfilePic/ProfilePic'

{header, h1, img, a, div, span, p, button} = fission.React.DOM


View = fission.view
  render: ->
    @props?.color ?= 'light'
    @props?.background ?= ''

    style =
      className: "navbar #{@props?.color} #{@props?.background}"

    div style,
      a href: '/',
        div className: 'logo', fission.config.name
      div className: 'right',
        if window._user?
          div className: 'user',
            a href: "/#{window._user._id}", className: 'image',
              ProfilePicView
                image: window._user.image
                size: 40

module.exports = View
