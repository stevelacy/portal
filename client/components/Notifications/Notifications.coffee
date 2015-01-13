fission = require '../../app'

{div} = fission.DOM

Model = fission.model
  props:
    title: 'string'
    message: 'string'
    type: 'string'
  sync: (method, m, opts) -> return m

itemView = fission.modelView
  model: Model
  init: ->
    o =
      opacity: 0.8
    return o
  mounted: ->
    setTimeout =>
      @destroy()
    , 4000
  destroy: ->
    @setState opacity: 0, height: 0
    setTimeout =>
      @model.destroy()
    , 1000
  render: ->
    @state.height ?= ''
    div
      className: "notification #{@model.type}"
      style:
        opacity: @state.opacity,
        height: @state.height
      div
        className: 'close'
        onClick: @destroy
        , '✕'
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
