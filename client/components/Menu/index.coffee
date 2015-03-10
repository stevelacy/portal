{component, DOM} = require 'fission'

ProfilePicView = require '../../components/ProfilePic'
MenuItems = require './Items'

{div, h1, img} = DOM

module.exports = component
  displayName: 'Menu'
  render: ->
    div className: 'menu component',


      div className: 'header',
        div className: 'user',
          div className: 'image',
            ProfilePicView
              image: window._user?.image
          div className: 'name', window._user?.name


      MenuItems close: @props.close
