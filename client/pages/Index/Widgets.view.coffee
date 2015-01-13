fission = require '../../app'

Widget = require '../../models/Widget'
WidgetView = require './Widget.view'
AddItem = require '../../components/AddItem/AddItem'

{div, button} = fission.DOM

View = fission.collectionView
  itemView: WidgetView
  model: Widget
  render: ->
    return div className: 'widgets',
      @items.map (item) ->
        if item.props.model?._values?.widget?.activated
          item

      AddItem()
module.exports = View
