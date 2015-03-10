{collectionView, DOM} = require 'fission'

MenuItem = require '../../models/MenuItem'
MenuItemsView = require './Item'
{div, ul} = DOM

module.exports = collectionView
  displayName: 'SideBarItems'
  itemView: MenuItemsView
  collection:
    model: MenuItem
  render: ->
    ul
      className: 'items'
      onClick: @props.close,
      @items
