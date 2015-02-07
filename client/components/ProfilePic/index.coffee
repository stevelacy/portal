{component, DOM} = require 'fission'

{img, div} = DOM

module.exports = component
  displayName: 'ProfilePic'
  render: ->
    pic = div
      style: backgroundImage: "url(#{@props.image})"
      className: 'profile-pic component',
        div className: 'profile-pic-top'
        div className: 'profile-pic-bottom'
    @transferPropsTo pic
