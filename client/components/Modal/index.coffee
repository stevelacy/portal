{component, DOM} = require 'fission'

{div, button} = DOM

module.exports = component
  displayName: 'Modal'

  closeModal: ->
    setTimeout @props.onClose, 10

  mounted: ->
    window.addEventListener 'keydown', (e) =>
      return unless e.keyCode == 27
      return unless @isMounted()
      @closeModal()

  render: ->
    return div className: 'modal component',
      button
        className: 'button light close'
        onClick: @closeModal
        , 'X'
      @props.content @props.data
