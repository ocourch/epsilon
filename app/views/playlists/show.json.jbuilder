json.(@playlist, :id, :title, :show_name)
json.songs @playlist.playlist_songs do |psong|
  json.title psong.song.title
  json.album psong.song.album.name
  json.artist psong.song.album.artist.name
  json.time_played psong.time_played.to_s
  json.location psong.song.album.location
  json.duration (psong.song.duration / 60).to_s + ":" + (psong.song.duration % 60).to_s.rjust(2,'0')
end
