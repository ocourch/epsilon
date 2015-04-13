json.array!(@playlists) do |playlist|
  json.extract! playlist, :id, :user_id, :playlist_id, :songs
  json.url playlist_url(playlist, format: :json)
end
