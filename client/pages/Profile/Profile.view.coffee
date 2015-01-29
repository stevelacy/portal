fission = require '../../app'
NavbarView = require '../../components/NavBar/NavBar'
SideBarView = require '../../components/SideBar/SideBar'

{div} = fission.DOM

module.exports = fission.view
  render: ->
    return div className: 'main profile',
      NavbarView
        color: 'light'
      div className: 'page',
        SideBarView()
        div className: 'content',

