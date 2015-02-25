json.array!(@playlists) do |playlist|
  json.extract! playlist, :id, :u_id, :playlist_id
  json.url playlist_url(playlist, format: :json)
end
