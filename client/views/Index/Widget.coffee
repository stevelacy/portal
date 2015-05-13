{modelView, DOM, Link} = require 'fission'

Plugin = require '../../models/Plugin'

{div, button, iframe} = DOM

module.exports = modelView
  displayName: 'Widget'
  model: Plugin
  init: ->
    minimized: false

  delete: ->
    @model.set activated: false
    @model.save
      success: (data) ->
        @model.destroy()

  minimize: ->
    @model.minimized = !@model.minimized
    @model.save()

    @setState minimized: @model.minimized

  mounted: ->
    @setState minimized: @model.minimized

  render: ->
    return null unless @model?
    widgetWidth = =>
      if @model.size == 'small'
        return '23%'
      if @model.size == 'medium'
        return '48%'
      return '100%'
    widgetHeight = =>
      return 400 unless @state.minimized
      return 40

    return div
      className: 'widget',
      style:
        width: widgetWidth()
        height: widgetHeight()

        div
          className: 'controls',
          Link
            className: 'name'
            to: 'plugin'
            params:
              pluginId: @model.getId()
            , @model.name
          button
            className: 'button close light'
            onClick: @delete,
              'X'
          button
            className: 'button minimize light'
            onClick: @minimize,
              if @model.minimized then '+' else '_'
        div className: 'frame',
          iframe
            src: "/static/#{@model.name}/#{@model.html}"
