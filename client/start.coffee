request = require 'superagent'
router = require './router'


request
  .post "#{fission.config.url}/auth?token=#{window._token}"
  .end (err, res) ->
    window._user = res?.body
    router.start document.body
