{modelView, DOM, Link} = require 'fission'
superagent = require 'superagent'

MenuItem = require '../../models/MenuItem'

{div, li, a} = DOM

module.exports = modelView
  displayName: 'SideBarItem'
  model: MenuItem
  render: ->
    linkClass = =>
      return '' unless window.location.pathname.indexOf(@model.page) > -1
      return 'active'
    return Link to: @model.page,
      li
        className: linkClass(),
          @model.name
