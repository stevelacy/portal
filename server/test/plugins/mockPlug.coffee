setup = require '../setup'

module.exports =
  _id: setup.newId()
  name: 'test-plugin'
  main: 'test.coffee'
  widget:
    html: 'test.html'
