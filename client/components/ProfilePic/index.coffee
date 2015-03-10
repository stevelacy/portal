{component, DOM} = require 'fission'

{img, div} = DOM

module.exports = component
  displayName: 'ProfilePic'
  render: ->
    pic = div className: 'profile-pic component',
      div className: 'first',
        div
          className: 'image'
          style:
            background: "url(#{@props.image})"
            backgroundPosition: 'center center'
            backgroundRepeat: 'no-repeat'

    console.log @props
    @transferPropsTo pic
