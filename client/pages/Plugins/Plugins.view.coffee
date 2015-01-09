fission = require '../../app'
NavbarView = require '../../components/NavBar/NavBar'
SideBarView = require '../../components/SideBar/SideBar'
Plugin = require '../../models/Plugin'

pluginView = require './Plugin.view'
{div} = fission.DOM

module.exports = ->
  return window.location = '/login' unless window._user
  fission.collectionView
    model: Plugin
    itemView: pluginView
    render: ->
      return div className: 'main plugins',
        NavbarView
          color: 'light'
        div className: 'page',
          SideBarView()
          div className: 'content',
            div className: 'items',
              @items
