module.exports = (user) ->
  src = ""
  if user?
    src += "window._user = {"
    src += "_id: '#{user._id}',"
    src += "handle: '#{user.handle}',"
    src += "name: '#{user.name}',"
    src += "twid: '#{user.twid}',"
    src += "image: '#{user.image}'"
    src += "};"
  else
    src += "window._user = null;"
  return src
