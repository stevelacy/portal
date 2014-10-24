fission = require '../../app'
NavbarView = require '../../components/NavBar/NavBar'
ModalView = require '../../components/Modal/Modal'
SearchWidgets = require '../../components/SearchWidgets/SearchWidgets'
Widgets = require './Widgets.view'
{div, button} = fission.React.DOM

module.exports = ->
  return fission.router.router '/login' unless window._user
  fission.view
    init: ->
      o =
        openModal: false
        widgets: true
      return o
    toggleWidget: ->
      stat = @state.openModal
      @setState openModal: !stat
      console.log stat
      if stat
        #@replaceState @init()
        @setState widgets: false
        @setState widgets: true

    render: ->
      return div className: 'main index',
        NavbarView
          color: 'light'
        div className: 'page',
          if @state.openModal
            ModalView
              onClose: @toggleWidget
              content: SearchWidgets
          button
            className: 'button add widget light'
            onClick: @toggleWidget,
              'ADD WIDGET'
          if @state.widgets
            Widgets()


