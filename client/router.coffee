request = require 'superagent'
fission = require './app.coffee'

IndexView = require './pages/Index/Index.view'
LoginView = require './pages/Login/Login.view'
PluginsView = require './pages/Plugins/Plugins.view'
PluginView = require './pages/Plugin/Plugin.view'

module.exports = fission.router

  home:
    path: '/'
    view: IndexView

  login:
    path: '/login'
    view: LoginView


  plugins:
    path: '/plugins'
    view: PluginsView

  plugin:
    path: '/plugins/:id'
    view: PluginView
###
  logout:
    path: '/logout'
    view: ->
      window.localStorage.setItem 'token', ''
      request.post "#{fission.config.url}/logout?token=#{window._token}", (err, res) ->
        console.log err if err?
        window.location = '/'
###

