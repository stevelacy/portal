{join} = require 'path'

module.exports =
  database: 'mongodb://localhost:27017/portal'
  name: 'P.O.R.T.A.L'
  title: 'P.O.R.T.A.L'
  url: 'http://192.168.0.2:5000'
  token:
    secret: 'IhoiUHyu6gt5HJHhjhhGfddsESEWsfgHJjhhjFDdsseseRDSTDfgghhjHJljklkjuiuyyUYUtytrRERerererERerererRTGHghj'
  twitter:
    consumerKey: '3N2jsOUin20cNJh9IyDnw'
    consumerSecret: 'kQsFOwFQxODOdhENggeHlzHwjHtogcenzuwRsOGNoFg'
    callback: '/auth/twitter/callback'

  facebook:
    clientID: '295845293906891'
    clientSecret: 'd20684330f927425b8bbeab3d28cfc76'
    callback: '/auth/facebook/callback'

  google:
    callback: '/auth/google/callback'
    clientId: '317431375620-o6jmnnihqd99jdmhulkea1p3qq6gfhn8.apps.googleusercontent.com'
    clientSecret: 'kOuiaA-AlXgNprT8UydyQ9uU'

  mongo:
    url: 'mongodb://127.0.0.1:27017/portal'
    host: '127.0.0.1'
    port: 27017
    name: 'portal'
