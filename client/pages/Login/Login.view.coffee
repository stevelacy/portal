request = require 'superagent'
fission = require '../../app'
NavbarView = require '../../components/NavBar/NavBar'

{div, h1, button, a, img, br, form, input} = fission.DOM

module.exports = fission.view
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

  login: (e) ->
    e.preventDefault()
    data =
      email: @state.email
      password: @state.password
    request.post '/login', data, (err, res) =>
      if res?.status == 200
        window.localStorage.setItem 'token', res.body.token
        window._user = res.body.user
        console.log window._user
        @transitionTo 'home'
      else
        console.log err, res
        @setState status: res.body.message
        setTimeout =>
          @setState status: ''
        , 2000

  mounted: ->
    @refs.email.getDOMNode().focus()

  render: ->
    div className: 'main login',
      NavbarView
        color: 'transparent'
      div className: 'page',
        #div className: 'spacer-100'
        div className: 'box',

          div className: 'logo white', 'Login'
          form
            method: 'post'
            onSubmit: @login,
            input
              ref: 'email'
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

            input
              type: 'submit'
              value: 'LOGIN'
              className: 'button blue large wide center'
              style: cursor: 'pointer'
            div className: 'status',
              @state.status
