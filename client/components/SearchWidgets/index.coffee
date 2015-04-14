{collectionView, DOM} = require 'fission'

Plugin = require '../../models/Plugin'
SearchWidget = require './SearchWidget'
{div, button, a} = DOM

module.exports = collectionView
  displayName: 'SearchWidgets'
  itemView: SearchWidget
  collection:
    model: Plugin
  render: ->
    return null unless @items?
    return div className: 'search-widgets component',
      div className: 'title', 'Plugins'
      if !@items[0]
        a
          className: 'title'
          href: '/plugins'
          , 'Please activate a plugin'
      @items
