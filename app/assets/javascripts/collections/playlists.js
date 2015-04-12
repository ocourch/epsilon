var Playlists = Backbone.Collection.extend({
  model: Playlist,
  url: '/playlists'
});
