{collectionView, DOM} = require 'fission'

MenuItem = require '../../models/MenuItem'
MenuItemsView = require './SideBarItem'
{div, ul} = DOM

module.exports = collectionView
  displayName: 'SideBarItems'
  itemView: MenuItemsView
  collection:
    model: MenuItem
  render: ->
    return ul null,
      @items
