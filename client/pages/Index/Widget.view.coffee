fission = require '../../app'

Widget = require '../../models/Widget'

{div, button, iframe} = fission.React.DOM

View = fission.modelView
  model: Widget
  delete: ->
    @model.set widget: activated: false
    @model.save
      success: (data) ->
        @model.destroy()
  render: ->
    iframeSize = =>
      if @model.widget.size == 'small'
        return '25%'
      if @model.widget.size == 'medium'
        return '50%'
      return '100%'

    return div className: 'widget',
      div
        style: width: iframeSize()
        className: 'frame',
        button
          className: 'button close light'
          onClick: @delete,
            'X'
        console.log @model
        iframe
          src: "#{fission.config.url}/static/#{@model.name}/#{@model.widget.html}"
          scrolling: 'no'

module.exports = View
