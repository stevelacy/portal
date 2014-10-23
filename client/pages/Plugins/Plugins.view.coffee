fission = require '../../app'
NavbarView = require '../../components/NavBar/NavBar'
Plugin = require '../../models/Plugin'

pluginView = require './Plugin.view'
{div} = fission.React.DOM

module.exports = ->
  return fission.router.router '/login' unless window._user
  fission.collectionView
    model: Plugin
    itemView: pluginView
    render: ->
      return div className: 'main plugins',
        NavbarView
          color: 'light'
        div className: 'page',
          div className: 'title',
            'Plugins'
          div className: 'items',
            @items

