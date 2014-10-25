superagent = require 'superagent'
fission = require '../../app'

Widget = require '../../models/Widget'

{div, button} = fission.React.DOM

View = fission.modelView
  model: Widget
  init: ->
    return activated: false
  mounted: ->
    @setState activated: @model.widget.activated
  toggle: ->
    data =
      name: @model.name
      widget:
        activated: !@state.activated

    #superagent.put "#{fission.config.url}/v1/widgets/#{@model.name}", data, (err, res) ->
    #  console.log res
    @model.set
      widget:
        activated: !@state.activated
    @model.save()
    @setState activated: !@state.activated

    console.log @model
  render: ->
    return div className: 'item',
      div className: 'name',
        @model.name
      button
        className: 'button add blue'
        onClick: @toggle,
          if @state.activated
            'REMOVE'
          else
            'ADD'

module.exports = View
