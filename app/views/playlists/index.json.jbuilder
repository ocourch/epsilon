json.array!(current_user.playlists) do |playlist|
  json.(playlist, :show_name, :title)
  json.url playlist_url(playlist, format: :json)
end