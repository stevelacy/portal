fission = require '../../app'

{div, h1} = fission.DOM


View = fission.view
  render: ->
    div className: 'infobar',
      h1 null, 'INFO'


module.exports = View
