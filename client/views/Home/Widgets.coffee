{collectionView, DOM} = require 'fission'

Widget = require '../../models/Widget'
WidgetView = require './Widget'
AddItem = require '../../components/AddItem/'
ModalView = require '../../components/Modal'
SearchWidgets = require '../../components/SearchWidgets'

{div, button} = DOM

module.exports = collectionView
  displayName: 'Widgets'
  itemView: WidgetView
  collection:
    model: Widget
  filter: (i) ->
    return i.widget.activated
  init: ->
    o =
      openModal: false
      widgets: true
  toggleModal: ->
    @setState openModal: !@state.openModal
    if !@state.openModal
      @collection.fetch()
  render: ->
    return div className: 'widgets view',
      if @state.openModal
        ModalView
          onClose: @toggleModal
          content: SearchWidgets
      # @items.map (item) ->
      #   if item.props.model?._values?.widget?.activated
      #     item
      @items

      AddItem
        onClick: @toggleModal
