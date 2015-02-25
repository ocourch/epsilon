json.array!(@users) do |user|
  json.extract! user, :id, :u_id, :first_name, :last_name, :dj_alias, :station, :admin
  json.url user_url(user, format: :json)
end
