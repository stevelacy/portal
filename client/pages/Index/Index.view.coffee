fission = require '../../app'
NavbarView = require '../../components/NavBar/NavBar'

{div} = fission.React.DOM

module.exports = ->
  return fission.router.router '/login' unless window._user
  fission.view
    render: ->
      return div className: 'main index',
        NavbarView
          color: 'light'
        div className: 'page'


