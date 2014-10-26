fission = require '../../app'

{div, button} = fission.React.DOM


View = fission.view
  close: ->
    setTimeout @props.onClose, 10
  render: ->
    return div className: 'modal',
      button
        className: 'button light close'
        onClick: @close
        , 'X'
      @props.content()

module.exports = View
