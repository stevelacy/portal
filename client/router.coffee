request = require 'superagent'
{router, view} = require 'fission'

Login = require './views/Login'
Application = require './views/Application'
Plugins = require './views/Plugins'
Plugin = require './views/Plugin'
Logout = require './lib/Logout'
Home = require './views/Home'


module.exports = router
  login:
    path: 'login'
    view: Login
  logout:
    path: 'logout'
    view: Logout
  app:
    path: '/'
    view: Application
    title: 'P.O.R.T.A.L'
    children:
      home:
        view: Home
        default: true
      plugins:
        path: 'plugins'
        view: Plugins
      plugin:
        path: 'plugins/:pluginId'
        view: Plugin
