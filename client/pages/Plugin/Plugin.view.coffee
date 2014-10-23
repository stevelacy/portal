fission = require '../../app'
NavbarView = require '../../components/NavBar/NavBar'
Plugin = require '../../models/Plugin'

{div, iframe} = fission.React.DOM

module.exports = ->
  return fission.router.router '/login' unless window._user
  fission.modelView
    model: Plugin
    render: ->
      return div className: 'main plugin',
        NavbarView
          color: 'light'
        div className: 'page',
          div className: 'item',
            'Plugin:'
            div className: 'name', @model.name
            div className: 'description', @model.description
            console.log @model.html
            iframe src: "#{fission.config.url}#{@model.html}"
