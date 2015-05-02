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
      <tr>
        <td>{this.props.time_played}</td>
        <td>{this.props.title}</td>
        <td>{this.props.artist}</td>
        <td>{this.props.album}</td>
        <td>{this.props.duration}</td>
        <td>{this.props.location}</td>
      </tr>
    );
  }
});
