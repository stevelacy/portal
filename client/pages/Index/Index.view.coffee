fission = require '../../app'
ModalView = require '../../components/Modal/Modal'
NavbarView = require '../../components/NavBar/NavBar'
InfoBarView = require '../../components/InfoBar/InfoBar'
SideBarView = require '../../components/SideBar/SideBar'
NotificationsView = require '../../components/Notifications/Notifications'
SearchWidgets = require '../../components/SearchWidgets/SearchWidgets'
Widgets = require './Widgets.view'

{div, button} = fission.DOM

module.exports = ->
  return window.location = '/login' unless window._user?
  fission.view
    init: ->
      o =
        openModal: false
        widgets: true
      return o
    toggleModal: ->
      stat = @state.openModal
      @setState openModal: !stat
      if stat
        #@replaceState @init()
        @setState widgets: false
        @setState widgets: true

    render: ->
      return div className: 'main index',
        NavbarView
          color: 'light'
        NotificationsView()
        div className: 'page',
          SideBarView()
          div className: 'content',
            InfoBarView()
            if @state.openModal
              ModalView
                onClose: @toggleModal
                content: SearchWidgets
            button
              className: 'button add widget light'
              onClick: @toggleModal,
                'ADD WIDGET'
            if @state.widgets
              Widgets()
