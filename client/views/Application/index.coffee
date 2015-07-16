{DOM, ChildView, view} = require 'fission'
NavBar = require '../../components/NavBar'
Notifications = require '../../components/Notifications'
Menu = require '../../components/Menu'
{div} = DOM

module.exports = view
  displayName: 'Application'
  statics:
    willTransitionTo: (transition) ->
      token = window.localStorage.getItem 'token'
      return transition.redirect 'login' unless token?
  init: ->
    animation: null

  toggleMenu: ->
    if @state.animation?
      return @setState animation: null
    @setState animation: 'animated'

  mounted: ->
    window.addEventListener 'keydown', (e) =>
      return unless e.keyCode is 27
      return unless @isMounted() and @state.animation?
      @toggleMenu()

  render: ->
    div
      className: "main view application #{@state.animation}"

      if @state.animation?
        Menu onClose: @toggleMenu
      div
        className: "menu-button #{@state.animation}"
        onClick: @toggleMenu
        '☰'

      div className: 'test'
      NavBar()
      Notifications()
      ChildView()
