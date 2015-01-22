superagent = require 'superagent'
fission = require '../../app'

Widget = require '../../models/Widget'

{div, button} = fission.DOM

View = fission.modelView
  model: Widget
  init: ->
    return activated: false
  mounted: ->
    @setState activated: @model.widget.activated
  toggle: ->
    @model.set
      widget:
        activated: !@state.activated
    @model.save()
    @setState activated: !@state.activated

  render: ->
    buttonClass = =>
      return 'red' unless !@state.activated
      return 'blue'

    return div className: 'item',
      div className: 'name',
        @model.name

      button
        className: "button add #{buttonClass()}"
        onClick: @toggle,
          if @state.activated
            'REMOVE'
          else
            'ADD'

module.exports = View
