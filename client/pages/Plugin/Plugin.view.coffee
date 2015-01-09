fission = require '../../app'
NavbarView = require '../../components/NavBar/NavBar'
Plugin = require '../../models/Plugin'

{div, iframe} = fission.DOM

module.exports = ->
  return window.location = '/login' unless window._user?
  View = fission.modelView
    model: Plugin
    render: ->
      return div className: 'main plugin',
        NavbarView
          color: 'light'
        div className: 'page',
          div className: 'info',
            div className: 'name', @model.name
            div className: 'description', @model.description
          iframe
            src: "#{fission.config.url}#{@model.html}"
          console.log @model
          #src: "#{fission.config.url}#{@model.html}"
  return View
