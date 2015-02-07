{collectionView, DOM} = require 'fission'
{div} = DOM

NavbarView = require '../../components/NavBar'
SideBarView = require '../../components/SideBar'
Plugin = require '../../models/Plugin'

pluginView = require './Plugin'

module.exports = collectionView
  displayName: 'Plugins'
  statics:
    willTransitionTo: (transition) ->
      token = window.localStorage.getItem 'token'
      return transition.redirect 'login' unless token?
  model: Plugin
  itemView: pluginView
  render: ->
    div className: 'plugins view',
      div className: 'page',
        div className: 'content',
          div className: 'items',
            @items
