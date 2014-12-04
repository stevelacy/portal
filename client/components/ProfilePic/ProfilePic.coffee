fission = require "../../app"

{img, div} = fission.React.DOM

View = fission.view
  render: ->

    pic = div
      style: backgroundImage: "url(#{@props.image})"
      className: 'profile-pic',
        div className: 'profile-pic-top'
        div className: 'profile-pic-bottom'
    @transferPropsTo pic

module.exports = View
