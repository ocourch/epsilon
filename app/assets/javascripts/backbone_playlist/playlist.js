var PlaylistModel = Backbone.Model.extend({
  urlRoot: '/playlists'
});

var SongModel = Backbone.Model.extend();

var SongList = Backbone.Collection.extend();

var SongListView = Backbone.View.extend({
  el: $("#songTable"),
  
  initialize: function() {
    this.collection.bind("add", this.render, this);
  },
  
  render: function() {
    _.each(this.collection.models, function(data) {
      this.$el.append(new SongView({
        model: data
      }).render().el);
    }, this);
    return this;
  }
});

var PlaylistView = Backbone.View.extend({
  el: $("#playlistContainer"),
  
  events: {
    "click .title": "toggleEdit"
  },
  
  initialize: function() {
    this.listenTo(this.model, 'change', this.render);
  },
  
  toggleEdit: function() {
    //todo
  }
});

var SongView = Backbone.View.extend({
  tagName: 'tr',
  
  template: Handlebars.compile($("#songTemplate").html()),
  
  events: {
    "click input": "toggleEdit",
    "click .destroy": "clear"
  },
  
  initialize: function() {
    this.listenTo(this.model, "change", this.render);
    this.listenTo(this.model, "destroy", this.remove)
  },
  
  render: function() {
    //todo
  },
  
  toggleEdit: function() {
    //todo
  },
  
  clear: function() {
    this.model.destroy();
  }
});
