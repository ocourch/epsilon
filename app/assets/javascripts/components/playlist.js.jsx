var Playlist = React.createClass({
  propTypes: {
    title: React.PropTypes.string,
    show: React.PropTypes.string,
    songs: React.PropTypes.array
  },

  render: function() {
    var songNodes = this.props.songs.map(function (song, index) {
      return (
        /*<Song title={song.title} album={song.album} artist={song.artist} duration={song.duration} location={song.loc} played=song.played key={index}/>*/
        null
        );
    })
    return (
      <table>
        <tr>
          <th>Time Played</th>
          <th>Song</th>
          <th>Album</th>
          <th>Artist</th>
          <th>Duration</th>
          <th>Location</th>
        </tr>
        {songNodes}
      </table>
    );
  }
});
