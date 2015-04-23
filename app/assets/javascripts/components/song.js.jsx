var Song = React.createClass({
  propTypes: {
    title: React.PropTypes.string,
    artist: React.PropTypes.string,
    album: React.PropTypes.string,
    duration: React.PropTypes.string,
    timePlayed: React.PropTypes.string,
    location: React.PropTypes.string
  },

  render: function() {
    return (
      <div>
        <div>Title: {this.props.title}</div>
        <div>Artist: {this.props.artist}</div>
        <div>Album: {this.props.album}</div>
        <div>Duration: {this.props.duration}</div>
        <div>Time Played: {this.props.time_played}</div>
        <div>Location: {this.props.location}</div>
      </div>
    );
  }
});
