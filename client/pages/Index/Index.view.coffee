fission = require '../../app'
NavbarView = require '../../components/NavBar/NavBar'
InfoBarView = require '../../components/InfoBar/InfoBar'
SideBarView = require '../../components/SideBar/SideBar'
NotificationsView = require '../../components/Notifications/Notifications'
Widgets = require './Widgets.view'

{div, button} = fission.DOM

module.exports = fission.view
  render: ->
    return div className: 'main index',
      #NavbarView
      #  color: 'light'
      #NotificationsView()
      div className: 'page',
        SideBarView()
        div className: 'content',
          #InfoBarView()
          #Widgets()
