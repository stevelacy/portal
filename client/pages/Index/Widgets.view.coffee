fission = require '../../app'

Widget = require '../../models/Widget'
WidgetView = require './Widget.view'
AddItem = require '../../components/AddItem/AddItem'
ModalView = require '../../components/Modal/Modal'
SearchWidgets = require '../../components/SearchWidgets/SearchWidgets'

{div, button} = fission.DOM

View = fission.collectionView
  itemView: WidgetView
  model: Widget
  init: ->
    o =
      openModal: false
      widgets: true
  toggleModal: ->
    @setState openModal: !@state.openModal
    if !@state.openModal
      @collection.fetch()
  render: ->
    return div className: 'widgets',
      if @state.openModal
        ModalView
          onClose: @toggleModal
          content: SearchWidgets
      @items.map (item) ->
        if item.props.model?._values?.widget?.activated
          item

      AddItem
        onClick: @toggleModal
module.exports = View
