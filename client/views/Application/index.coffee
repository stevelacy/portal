{DOM, ChildView, view} = require 'fission'
NavBar = require '../../components/NavBar'
SideBar = require '../../components/SideBar'
{div} = DOM

module.exports = view
  displayName: 'Application'
  statics:
    willTransitionTo: (transition) ->
      token = window.localStorage.getItem 'token'
      return transition.redirect 'login' unless token?
  render: ->
    div
      className: 'main view application'
    ,
      NavBar()
      SideBar()
      div className: 'content',
        ChildView()
