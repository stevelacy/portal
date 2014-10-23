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


module.exports = router
