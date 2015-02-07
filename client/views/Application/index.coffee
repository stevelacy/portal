{DOM, ChildView, view} = require 'fission'
NavBar = require '../../components/NavBar'
SideBar = require '../../components/SideBar'
{div} = DOM

module.exports = view
  statics:
    willTransitionTo: (transition) ->
      token = window.localStorage.getItem 'token'
      return transition.redirect 'login' unless token?
  displayName: 'Application'
  render: ->
    div
      className: 'main view application'
    ,
      NavBar()
      SideBar()
      div className: 'content',
        ChildView()
