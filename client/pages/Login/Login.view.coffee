request = require 'superagent'
fission = require '../../app'
NavbarView = require '../../components/NavBar/NavBar'

{div, h1, button, a, img, br, input} = fission.React.DOM

module.exports = ->

  fission.view
    init: ->
      o =
        email: ''
        password: ''
        status: ''
      return o

    updateEmail: (e) ->
      @setState email: e.target.value

    updatePassword: (e) ->
      @setState password: e.target.value

    login: ->
      data =
        email: @state.email
        password: @state.password
      request.post '/login', data, (err, res) =>
        if res?.status == 200
          window.location = '/'
        else
          @setState status: 'Incorrect email or password'


    render: ->
      div className: 'main login',
        NavbarView
          color: 'transparent'
        div className: 'page',
          #div className: 'spacer-100'
          div className: 'box',

            div className: 'logo white', 'Login'
            input
              type: 'email'
              name: 'email'
              placeholder: 'Email'
              value: @state.email
              onChange: @updateEmail
            input
              type: 'password'
              name: 'password'
              value: @state.password
              onChange: @updatePassword
              placeholder: '****'

            button
              className: 'button blue large wide center'
              style: cursor: 'pointer'
              onClick: @login,
                'LOGIN'
            div className: 'status',
              @state.status
