fission = require "../../app"

{img} = fission.React.DOM

View = fission.view
  getDefaultProps: -> {size: 20}
  render: ->

    pic = img
      className: 'profile-pic'
      src: @props.image
      height: @props.size
      width: @props.size
    @transferPropsTo pic

module.exports = View
