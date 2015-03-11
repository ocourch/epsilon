json.array!(@station_albums) do |station_album|
  json.extract! station_album, :id, :station_id, :album_id
  json.url station_album_url(station_album, format: :json)
end
