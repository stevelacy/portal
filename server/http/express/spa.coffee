{join} = require 'path'
app = require './'
config = require '../../config'
idxFile = join config.pubdir, 'index.html'

app.get "/config.js", (req, res) ->
  src = "window._config = {"
  src += "  name: '#{config.name}',"
  src += "  title: '#{config.title}',"
  src += "  url: '#{config.url}',"
  src += "  socketUrl: '#{config.url}/#{config.plugins.namespace}'"
  src += "};"

  res.set "Content-Type", "application/javascript"
  res.status 200
    .send src

app.get '/*', (req, res) ->
  res.sendFile idxFile

module.exports = app
