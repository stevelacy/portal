superagent = require 'superagent'
{modelView, DOM} = require 'fission'

Widget = require '../../models/Widget'

{div, button} = DOM

module.exports = modelView
  displayName: 'SearchWidget'
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
