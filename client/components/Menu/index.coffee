{component, DOM, Link} = require 'fission'

ProfilePicView = require '../../components/ProfilePic'
# MenuItems = require './Items'

{div, h1, img, ul} = DOM

module.exports = component
  displayName: 'Menu'
  init: ->
    animation: ''

  close: ->
    @setState animation: 'animation-close'
    setTimeout =>
      @props.onClose()
    , 100

  mounted: ->
    @setState animation: 'animation-open'

  render: ->
    div className: "menu component #{@state.animation}",
      div className: 'header',
        div
          className: 'close'
          onClick: @close
        , '×'

        div className: 'user',
          div className: 'image',
            ProfilePicView
              image: window._user?.image
          div className: 'name', window._user?.name

      # MenuItems close: @props.onClose
      ul className: 'items',
        Link
          className: 'item'
          onClick: @close
          to: 'plugins'
          'plugins'
        Link
          className: 'item'
          onClick: @close
          to: '/'
          'home'
