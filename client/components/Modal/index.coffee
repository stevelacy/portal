{component, DOM} = require 'fission'

{div, button} = DOM

module.exports = component
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
