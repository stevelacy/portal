{collectionView, DOM} = require 'fission'

Widget = require '../../models/Widget'
SearchWidget = require './SearchWidget'
{div, button, a} = DOM

module.exports = collectionView
  displayName: 'SearchWidgets'
  itemView: SearchWidget
  model: Widget
  render: ->
    return div className: 'search-widgets',
      div className: 'title', 'Widgets'
      if !@items[0]
        a
          className: 'title'
          href: '/plugins'
          , 'Please activate a plugin'
      @items
