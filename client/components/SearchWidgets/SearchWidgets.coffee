fission = require '../../app'

Widget = require '../../models/Widget'
SearchWidget = require './SearchWidget'
{div, button} = fission.React.DOM

View = fission.collectionView
  itemView: SearchWidget
  model: Widget
  render: ->
    return div className: 'search-widgets',
      div className: 'title', 'Widgets'
      @items

module.exports = View
