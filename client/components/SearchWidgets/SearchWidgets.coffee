fission = require '../../app'

Widget = require '../../models/Widget'
SearchWidget = require './SearchWidget'
{div, button, a} = fission.React.DOM

View = fission.collectionView
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

module.exports = View
