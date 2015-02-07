{component, DOM} = require 'fission'

{div, h1, img} = DOM


module.exports = component
  displayName: 'AddItem'
  render: ->
    div className: 'additem component',
      div className: 'wrapper',
        div
          className: 'plus'
          onClick: @props.onClick,
          img src: '/img/add.svg'
