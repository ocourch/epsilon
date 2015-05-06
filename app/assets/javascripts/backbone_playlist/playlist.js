var PlaylistModel = Backbone.Model.extend({
  urlRoot: '/playlists'
});

var SongModel = Backbone.Model.extend();

var SongList = Backbone.Collection.extend({
  model: SongModel
});

var SongListView = Backbone.View.extend({
  el: $("#songBody"),
  
  initialize: function() {
    this.collection.bind("add", this.render, this);
  },
  
  render: function() {
    _.each(this.collection.models, function(data) {
      $("#songBody").append(new SongView({
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
  
  events: {
    "click input": "toggleEdit",
    "click .destroy": "clear"
  },
  
  initialize: function() {
    this.listenTo(this.model, "change", this.render);
    this.listenTo(this.model, "destroy", this.remove);
  },
  
  render: function() {
    var template = HandlebarsTemplates['songs/show'];
    this.$el.html(template(this.model.toJSON()));
    return this;
  },
  
  toggleEdit: function() {
    //todo
  },
  
  clear: function() {
    this.model.destroy();
  }
});
