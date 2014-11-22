fission = require '../../app'

Widget = require '../../models/Widget'

{div, button, iframe} = fission.React.DOM

View = fission.modelView
  model: Widget
  init: ->
    return minimize: false
  delete: ->
    @model.set widget: activated: false
    @model.save
      success: (data) ->
        @model.destroy()
  minimize: ->
    @setState minimize: !@state.minimize
  render: ->
    widgetWidth = =>
      if @model.widget.size == 'small'
        return '25%'
      if @model.widget.size == 'medium'
        return '50%'
      return '100%'
    widgetHeight = =>
      return 400 unless @state.minimize
      return 40

    return div
      className: 'widget',
      style:
        width: widgetWidth()
        height: widgetHeight()
      ,
        div
          className: 'controls',
          div className: 'name', @model.name
          button
            className: 'button close light'
            onClick: @delete,
              'X'
          button
            className: 'button minimize light'
            onClick: @minimize,
              '_'
        console.log @model
        iframe
          src: "#{fission.config.url}/static/#{@model.name}/#{@model.widget.html}"
          scrolling: 'no'

module.exports = View
