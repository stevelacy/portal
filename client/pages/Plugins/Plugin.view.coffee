fission = require '../../app'
Plugin = require '../../models/Plugin'

{div, a} = fission.React.DOM

View = fission.modelView
  model: Plugin
  render: ->
    div className: 'plugin',
      a {href: "plugins/#{@model._id}"},
        div className: 'title', @model.title
        div className: 'content', @model.content

module.exports = View
