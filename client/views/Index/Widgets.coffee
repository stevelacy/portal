{collectionView, DOM} = require 'fission'

Plugin = require '../../models/Plugin'
WidgetView = require './Widget'
AddItem = require '../../components/AddItem/'
ModalView = require '../../components/Modal'
SearchWidgets = require '../../components/SearchWidgets'

{div, button} = DOM

module.exports = collectionView
  displayName: 'Widgets'
  itemView: WidgetView
  collection:
    model: Plugin
  filter: (i) ->
    return i.activated
  init: ->
    openModal: false
    widgets: true
  toggleModal: ->
    if @state.openModal
      @collection.fetch()
    @setState openModal: !@state.openModal
  render: ->
    return null unless @items?
    div className: 'widgets view',
      if @state.openModal
        ModalView
          onClose: @toggleModal
          content: SearchWidgets
      @items

      AddItem
        onClick: @toggleModal
