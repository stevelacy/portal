fission = require '../../app'

{div, button, ul, li} = fission.React.DOM
sideBarItems = require './SideBarItems'

View = fission.view
  render: ->
    div className: 'sidebar',
      div className: 'header'
      sideBarItems()

module.exports = View
