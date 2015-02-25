json.array!(@songs) do |song|
  json.extract! song, :id, :artist_id, :song_id, :artist_name, :title, :duration
  json.url song_url(song, format: :json)
end
