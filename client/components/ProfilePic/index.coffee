{component, DOM} = require 'fission'

{img, div} = DOM

module.exports = component
  render: ->

    pic = div
      style: backgroundImage: "url(#{@props.image})"
      className: 'profile-pic',
        div className: 'profile-pic-top'
        div className: 'profile-pic-bottom'
    @transferPropsTo pic
