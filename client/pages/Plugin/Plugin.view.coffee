fission = require '../../app'
NavbarView = require '../../components/NavBar/NavBar'
Plugin = require '../../models/Plugin'

{div} = fission.React.DOM

module.exports = ->
  return fission.router.router '/login' unless window._user
  fission.modelView
    model: Plugin
    render: ->
      return div className: 'main index',
        NavbarView
          color: 'light'
        div className: 'page',
          div className: 'title',
            'Plugins'
            div dangerouslySetInnerHTML:
              __html: @model.content
