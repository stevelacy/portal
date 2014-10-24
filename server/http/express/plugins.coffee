path = require 'path'
fs = require 'fs'
app = require './'
db = require '../../db'
config = require '../../config'
Plugin = db.model 'Plugin'


app.get '/static/plugins/:name/:html*.html', (req, res) ->
  return res.status(401).end() unless req.user?
  Plugin.findOne name: req.params.name, (err, plugin) ->
    return res.status(404).send '404' unless plugin?
    fs.readFile path.join(__dirname, "../../../#{config.plugins.path}#{plugin.name}/#{req.params.html}.html"), (err, data) ->
      return res.status(404).end() if err?
      return res.status(404).end() unless data?
      res.header 'Content-Type', 'text/html'
      res.status(200).send String data


app.get '/static/plugins/:name/:script*.js', (req, res) ->
  return res.status(401).end() unless req.user?
  Plugin.findOne name: req.params.name, (err, plugin) ->
    return res.status(404).send '404' unless plugin?
    #file = fs.readFileSync path.join(__dirname, "../../../#{config.plugins.path}#{plugin.name}/#{req.params.script}"), 'utf8'
    fs.readFile path.join(__dirname, "../../../#{config.plugins.path}#{plugin.name}/#{req.params.script}.js"), (err, data) ->
      return res.status(404).end() if err?
      return res.status(404).end() unless data?
      res.header 'Content-Type', 'text/javascript'
      res.status(200).send String data


app.get '/static/widgets/:name/:html*.html', (req, res) ->
  return res.status(401).end() unless req.user?
  Plugin.findOne name: req.params.name, (err, plugin) ->
    return res.status(404).send '404' unless plugin?
    fs.readFile path.join(__dirname, "../../../#{config.plugins.path}#{plugin.name}/#{req.params.html}.html"), (err, data) ->
      return res.status(404).end() if err?
      return res.status(404).end() unless data?
      res.header 'Content-Type', 'text/html'
      res.status(200).send String data

app.get '/static/widgets/:name/:script*.js', (req, res) ->
  return res.status(401).end() unless req.user?
  Plugin.findOne name: req.params.name, (err, plugin) ->
    return res.status(404).send '404' unless plugin?
    #file = fs.readFileSync path.join(__dirname, "../../../#{config.plugins.path}#{plugin.name}/#{req.params.script}"), 'utf8'
    fs.readFile path.join(__dirname, "../../../#{config.plugins.path}#{plugin.name}/#{req.params.script}.js"), (err, data) ->
      return res.status(404).end() if err?
      return res.status(404).end() unless data?
      res.header 'Content-Type', 'text/javascript'
      res.status(200).send String data


module.exports = app
