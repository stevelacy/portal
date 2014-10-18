app = require './'
config = require '../../config'
{join} = require 'path'
idxFile = join config.pubdir, 'index.html'

app.get "/serverConfig.js", (req, res) ->
  src = "window._serverConfig = {"
  src += "name: '#{config.name}'"
  src += "};"

  res.set "Content-Type", "application/javascript"
  res.status 200
    .send src


# serve spa
app.get '/*', (req, res) ->
  res.sendFile idxFile

module.exports = app
