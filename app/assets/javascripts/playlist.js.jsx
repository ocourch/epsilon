


var Playlist = React.createClass({
  loadSongsFromServer: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
       console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  handleAddSong: function(song) {
    var songs = this.state.data;
    songs.push(song);
    this.setState({data: songs}, function() {
      $.ajax({
        url: this.props.url,
        dataType: 'json',
        type: 'POST',
        data: {song: song},
        success: function() {
          this.setState({data: data})
        }.bind(this),
        error: function(xhr, status, err) {
          console.error(this.props.url, status, err.toString());
        }.bind(this)
      });
    });
  },
  getInitialState: function() {
    return {data: []};
  },
  componentDidMount: function() {
    this.loadCommentsFromServer();
    setInterval(this.loadCommentsFromServer, this.props.pollInterval);
  },
  render: function() {
    return(
      <table className="playlist">
        <tr>
          <th>Song</th>
          <th>Album</th>
          <th>Artist</th>
          <th>Time Played</th>
        </tr>
        <SongList data={this.state.data} />
        <SongForm onSongSubmit={this.handleSongSubmit} />
      </table>
    );
  }
});

var SongList = React.createClass({
  
  render: function() {
    var songNodes = this.props.data.map(function(song, index) {
      return (
        // `key` is a React-specific concept and is not mandatory for the
        // purpose of this tutorial. if you're curious, see more here:
        // http://facebook.github.io/react/docs/multiple-components.html#dynamic-children
        <Song key={index} />
        );
    });
    return (
      {songNodes}
    );
  }
});