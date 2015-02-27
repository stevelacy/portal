{view, DOM} = require 'fission'
InfoBar = require '../../components/InfoBar'
Notifications = require '../../components/Notifications'
Widgets = require './Widgets'

{div, button} = DOM

module.exports = view
  displayName: 'Home'
  statics:
    willTransitionTo: (transition) ->
      return transition.redirect 'login' unless window.token?
  render: ->
    div className: 'index view',
      Notifications()
      div className: 'page',
        div className: 'content',
          InfoBar()
          Widgets()
