superagent = require 'superagent'
fission = require '../../app'

MenuItem = require '../../models/MenuItem'

{div, li, a} = fission.React.DOM

View = fission.modelView
  model: MenuItem
  render: ->
    linkClass = =>
      return '' unless window.location.pathname.indexOf(@model.page) > -1
      return 'active'
    return a href: @model.page,
      li
        className: "#{linkClass()} ",
          @model.name

module.exports = View
