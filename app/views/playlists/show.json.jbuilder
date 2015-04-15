json.(@playlist, :title, :show_name)
json.songs @playlist.playlist_songs do |psong|
  json.title psong.song.title
  json.album psong.song.album.name
  json.artist psong.song.album.artist.name
  json.time_played = psong.time_played
end
