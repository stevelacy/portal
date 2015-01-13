fission = require '../../app'

MenuItem = require '../../models/MenuItem'
MenuItemsView = require './SideBarItem'
{div, ul} = fission.DOM

View = fission.collectionView
  itemView: MenuItemsView
  model: MenuItem
  render: ->
    return ul null,
      @items

module.exports = View
