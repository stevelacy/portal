{collectionView, DOM} = require 'fission'
{div} = DOM

NavbarView = require '../../components/NavBar'
Plugin = require '../../models/Plugin'

pluginView = require './Plugin'

module.exports = collectionView
  displayName: 'Plugins'
  statics:
    willTransitionTo: (transition) ->
      token = window.localStorage.getItem 'token'
      return transition.redirect 'login' unless token?
  collection:
    model: Plugin
  itemView: pluginView

  render: ->
    div className: 'plugins view page',
      div className: 'content',
        div className: 'items',
          @items
