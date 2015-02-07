{component, DOM} = require 'fission'

{div, button, ul, li} = DOM
ProfilePicView = require '../../components/ProfilePic'

sideBarItems = require './SideBarItems'


module.exports = component
  displayName: 'SideBar'
  render: ->
    div className: 'sidebar component',
      div className: 'header',
        div className: 'user',
          ProfilePicView
            image: window._user.image
          div className: 'name', window._user.name
      sideBarItems()
