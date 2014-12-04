fission = require '../../app'

ProfilePicView = require '../../components/ProfilePic/ProfilePic'

{div, button, ul, li} = fission.React.DOM
sideBarItems = require './SideBarItems'

View = fission.view
  render: ->
    div className: 'sidebar',
      div className: 'header',
        div className: 'user',
          ProfilePicView
            image: window._user.image
          div className: 'name', window._user.name
      sideBarItems()

module.exports = View
