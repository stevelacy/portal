fission = require '../../app'
ModalView = require '../../components/Modal/Modal'
NavbarView = require '../../components/NavBar/NavBar'
Plugin = require '../../models/Plugin'

{div, iframe, button, h1, textarea} = fission.DOM

modalContent = fission.view
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

module.exports = ->
  return window.location = '/login' unless window._user?
  View = fission.modelView
    model: Plugin
    init: ->
      o =
        openModal: false
      return o
    toggleModal: ->
      @setState openModal: !@state.openModal

    render: ->
      return div className: 'main plugin',
        NavbarView()
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

          iframe
            src: "#{fission.config.url}#{@model.html}"
  return View
