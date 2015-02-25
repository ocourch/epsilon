json.array!(@stations) do |station|
  json.extract! station, :id, :call_letters, :location, :station_id
  json.url station_url(station, format: :json)
end
