request = require 'superagent'
fission = require './app.coffee'
{router} = fission

IndexView = require './pages/Index/Index.view'
LoginView = require './pages/Login/Login.view'
PluginsView = require './pages/Plugins/Plugins.view'
PluginView = require './pages/Plugin/Plugin.view'


router.route '/',
  view: IndexView
  el: 'content'
  title: fission.config.title

router.route '/login',
  view: LoginView
  el: 'content'
  title: fission.config.title


router.route '/plugins',
  view: PluginsView
  el: 'content'
  title: fission.config.title

router.route '/plugins/:id',
  view: PluginView
  el: 'content'
  title: fission.config.title

router.route '/logout',
  view: ->
    window.localStorage.setItem 'token', ''
    request.post "#{fission.config.url}/logout?token=#{window._token}", (err, res) ->
      console.log err if err?
      window.location = '/'

module.exports = router
