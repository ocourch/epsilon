json.array!(@albums) do |album|
  json.extract! album, :id, :artist_id, :album_id, :released, :record_label, :genre
  json.url album_url(album, format: :json)
end
