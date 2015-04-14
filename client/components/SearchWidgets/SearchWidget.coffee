superagent = require 'superagent'
{modelView, DOM} = require 'fission'

Plugin = require '../../models/Plugin'

{div, button} = DOM

module.exports = modelView
  displayName: 'SearchPlugin'
  model: Plugin
  init: ->
    return activated: false
  mounted: ->
    @setState activated: @model.activated
  toggle: ->
    @model.set
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
