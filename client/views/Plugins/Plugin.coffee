superagent = require 'superagent'
{modelView, DOM, Link} = require 'fission'
Plugin = require '../../models/Plugin'

{div, a, button} = DOM

module.exports = modelView
  displayName: 'Plugin'
  model: Plugin
  activate: ->
    @model.set activated: !@model.activated
    @model.save()
  render: ->
    return null unless @model?
    Button = button
      className: if @model.activated then 'activate' else 'activate blue'
      onClick: @activate,
      if @model.activated then 'UNACTIVATE' else 'ACTIVATE'


    div className: 'item',
      Link
        to: "/plugins/#{@model._id}",
        div className: 'title', @model.name
      Button

      div className: 'content', @model.description
