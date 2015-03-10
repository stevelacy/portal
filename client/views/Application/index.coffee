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

  render: ->
    div
      className: "main view application #{@state.animation}"
    ,

      if @state.animation?
        Menu close: @toggleMenu
      div
        className: "menu-button #{@state.animation}"
        onClick: @toggleMenu
      ,
        if @state.animation?
          '×'
        else
          '☰'

      div className: 'test'
      NavBar()
      Notifications()
      # SideBar()
      ChildView()
