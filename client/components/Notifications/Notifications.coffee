fission = require '../../app'

{div} = fission.React.DOM

Model = fission.model
  props:
    title: 'string'
    message: 'string'
    type: 'string'

itemView = fission.modelView
  model: Model
  mounted: ->
    setTimeout =>
      @destroy()
    , 600000
  destroy: ->
    @model.destroy()
  render: ->
    div className: "notification #{@model.type}",
      div
        className: 'close'
        onClick: @destroy
        , 'X'
      if @model.title?
        div className: 'title', @model.title
      @model.message

View = fission.collectionView
  model: Model
  itemView: itemView
  init: ->
    return null
  mounted: ->
    fission.socket.on 'system:notification', (data) =>
      return unless data.message?
      @collection.create
        title: data.title
        message: data.message
        type: data.type

  render: ->
    div className: 'notifications',
      @items

module.exports = View
