fission = require '../../app'

{div, button} = fission.React.DOM


View = fission.view
  closeModal: ->
    setTimeout @props.onClose, 10
  mounted: ->
    window.addEventListener 'keydown', (e) =>
      return unless e.keyCode == 27
      @closeModal()
  render: ->
    return div className: 'modal',
      button
        className: 'button light close'
        onClick: @closeModal
        , 'X'
      @props.content @props.data

module.exports = View
