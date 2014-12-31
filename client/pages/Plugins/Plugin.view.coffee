superagent = require 'superagent'
fission = require '../../app'
Plugin = require '../../models/Plugin'

{div, a, button} = fission.React.DOM

View = fission.modelView
  model: Plugin
  activate: ->
    @model.set activated: !@model.activated
    @model.save()
  render: ->

    Button = button
      className: if @model.activated then 'activate' else 'activate blue'
      onClick: @activate,
      if @model.activated then 'UNACTIVATE' else 'ACTIVATE'


    div className: 'item',
      a
        href: "/plugins/#{@model._id}",
        div className: 'title', @model.name
      Button

      div className: 'content', @model.description


module.exports = View
