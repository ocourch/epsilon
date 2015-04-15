var Epsilon = {
  Models: {},
  Collections: {}.
  Views: {},
  Routers: {},
  initialize: function(data) {
    var playlist = new Epsilon.Collections.Playlist(data.playlist);
    new Epsilon.Routers.Playlist({playlist: playlist});
    Backbone.history.start();
  }
};
