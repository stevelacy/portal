{modelView, collectionView, DOM, model} = require 'fission'

{div} = DOM

Model = model
  props:
    title: 'string'
    message: 'string'
    type: 'string'
  sync: (method, m, opts) -> return m

itemView = modelView
  displayName: 'Notification'
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

module.exports = collectionView
  displayName: 'Notifications'
  model: Model
  itemView: itemView
  mounted: ->
    window.socket.on 'system:notification', (data) =>
      return unless data.message?
      @collection.create
        title: data.title
        message: data.message
        type: data.type

  render: ->
    div className: 'notifications component',
      @items
