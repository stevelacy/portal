fission = require '../../app'

{div, h1, img} = fission.DOM


View = fission.view
  render: ->
    div className: 'additem',
      div className: 'wrapper',
        div
          className: 'plus'
          onClick: @props.onClick,
          img src: '/img/add.svg'


module.exports = View
