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
    return div className: 'widget',
      div className: 'frame',
        button
          className: 'button delete light'
          onClick: @delete,
            'X'
        iframe
          src: "#{fission.config.url}/static/#{@model.name}/#{@model.widget.html}"
          scrolling: 'no'

module.exports = View
