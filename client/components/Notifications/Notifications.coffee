fission = require '../../app'

{div} = fission.React.DOM

View = fission.view
  render: ->
    div className: 'notifications',
      div className: 'notification', 'notification'
      div className: 'notification alert', 'notification'
      div className: 'notification success',
        div className: 'title', 'Title'
        'notification'
      div className: 'notification error', 'notification'

module.exports = View

