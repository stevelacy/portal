{component, modelView, DOM} = require 'fission'
ModalView = require '../../components/Modal'
NavbarView = require '../../components/NavBar'
Plugin = require '../../models/Plugin'

{div, iframe, button, h1, h2, textarea} = DOM

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
    return div className: 'plugin view page',
      if @state.openModal
        ModalView
          onClose: @toggleModal
          content: modalContent
          data: token: @model.token

      div className: 'info',
        div className: 'name', @model.name
        div className: 'description', @model.description
        if not @model.activated
          h2 className: 'red', 'Please activate the plugin first'
        else
          button
            className: 'token'
            onClick: @toggleModal
          , 'SHOW TOKEN'

      if @model.config? and @model.activated
        iframe
          className: 'iframe'
          src: "#{@model.config}"
