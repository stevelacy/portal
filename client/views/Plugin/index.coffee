{component, modelView, DOM} = require 'fission'
ModalView = require '../../components/Modal'
NavbarView = require '../../components/NavBar'
Plugin = require '../../models/Plugin'

{div, iframe, button, h1, textarea} = DOM

modalContent = component
  displayName: 'PluginModalContent'
  render: ->
    return div
      style:
        wordWrap: 'break-word'
        paddingTop: 50
    ,
      h1 null, 'Plugin token:'
      textarea
        style:
          width: '100%'
          height: 50
      , @props.token

module.exports = modelView
  displayName: 'Plugin'
  routeIdAttribute: 'pluginId'
  statics:
    willTransitionTo: (transition) ->
      return transition.redirect = 'login' unless window.token?
  model: Plugin

  init: ->
    openModal: false

  toggleModal: ->
    @setState openModal: !@state.openModal

  render: ->
    return null unless @model?.name?
    return div className: 'main plugin',
      div className: 'page',
        if @state.openModal
          ModalView
            onClose: @toggleModal
            content: modalContent
            data: token: @model.token
        div className: 'info',
          div className: 'name', @model.name
          div className: 'description', @model.description
          button
            className: 'token'
            onClick: @toggleModal
          , 'SHOW TOKEN'

        if @model.html?
          iframe
            src: "#{window.config.url}#{@model.html}"
