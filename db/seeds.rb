# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

genres = ['Blues', 'Folk', 'Rock', 'Pop', 'Metal', 'Electronic', 'Jazz', 'Rap']
locations = ['Spotify', 'mp3', 'Record: Shelf A', 'Record: Shelf B', 'Record: Shelf C', 'CD: Shelf D', 'CD: Shelf E', 'CD: Shelf F' ]
tf = [true, false]
Station.create(call_letters: "WBRS", location: "Waltham, MA", bio: "The Station of Brandeis University, committed to providing the best music for our fellow students")

s = Station.find(1)
#adds users to a station
(1..6).each do |index|
	f_name = Faker::Name.first_name
	d_name = "DJ" + Faker::Name.title
	l_name = Faker::Name.last_name
	em = Faker::Internet.email
	user = User.create! :email => em, :password => 'topsecret', :password_confirmation => 'topsecret', first_name: f_name, last_name: l_name,dj_alias: d_name
	s.users << user 
end



#makes music and adds to station
(1..10).each do |index|
  artist_name = Faker::Name.name

  Artist.create(name: artist_name, genre: genres.sample, id: index, bio: Faker::Lorem.paragraph)
  
  


  s.albums << Album.create(genre: genres.sample, location: locations.sample, artist_id: index, name: Faker::Commerce.product_name, released: Faker::Date.between(10.years.ago, Time.now), in_lib?:tf.sample, id: index)
  
   

  Song.create(title: Faker::Name.title, album_id: index, artist_id: index)

end



#adds Oscar as a user
user1 = User.create! :email => 'oscar.courchaine@gmail.com', :password => '12345678', :password_confirmation => '12345678', first_name: 'Oscar', last_name: 'Courchaine' ,dj_alias: 'DJ Pamela'
#gives oscar playlists
(1..6).each do |index|
	p = Playlist.create(title: Faker::Commerce.product_name, user_id: 100)
	(1..6).each do |index|
		p.songs << Song.create(title: Faker::Name.title, album_id: index, artist_id: index)
	end
	user1.playlists << p
end

s.users << user1

ActiveRecord::Base.connection.tables.each do |table|
  result = ActiveRecord::Base.connection.execute("SELECT id FROM #{table} ORDER BY id DESC LIMIT 1") rescue ( puts "Warning: not procesing table #{table}. Id is missing?" ; next )
  ai_val = result.any? ? result.first['id'].to_i + 1 : 1
  puts "Resetting auto increment ID for #{table} to #{ai_val}"
  ActiveRecord::Base.connection.execute("ALTER SEQUENCE #{table}_id_seq RESTART WITH #{ai_val}")
end