'use strict';

module.exports = {
  plugin: function(socket, db) {
    return socket.emit(db);

  },
  http: function (d) {
    return d;
  }
};
