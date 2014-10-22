fission = require '../../app'
NavbarView = require '../../components/NavBar/NavBar'

{div, h1, button, a, img, br} = fission.React.DOM

module.exports = ->

  fission.view
    twitter: ->
      window.location = '/auth/twitter'
    render: ->
      div className: 'main login',
        NavbarView
          color: 'light'
        div className: 'page',
          #div className: 'spacer-100'
          div className: 'login',

            div className: 'logo white', 'Login'
            button
              className: 'button blue large wide center'
              style: cursor: 'pointer'
              onClick: @twitter, 'TWITTER'
