fission = require '../../app'

{div} = fission.React.DOM

Model = fission.model
  props:
    title: 'string'
    message: 'string'
    type: 'string'

itemView = fission.modelView
  model: Model
  init: ->
    return opacity: 0.8
  mounted: ->
    setTimeout =>
      @setState opacity: 0
      setTimeout =>
        @destroy()
      , 1000
    , 4000
  destroy: ->
    @model.destroy()
  render: ->
    div
      className: "notification #{@model.type}"
      style: opacity: @state.opacity,
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
