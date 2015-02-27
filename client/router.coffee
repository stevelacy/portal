request = require 'superagent'
{router, view} = require 'fission'

Login = require './views/Login'
Application = require './views/Application'
Plugins = require './views/Plugins'
Plugin = require './views/Plugin'
Logout = require './lib/Logout'
Index = require './views/Index'


module.exports = router
  login:
    path: 'login'
    view: Login
  logout:
    path: 'logout'
    view: Logout
  plugin:
    path: 'plugins/:pluginId'
    view: Plugin
  app:
    path: '/'
    view: Application
    title: 'P.O.R.T.A.L'
    defaultChild:
      view: Index
    children:
      plugins:
        path: 'plugins'
        view: Plugins
