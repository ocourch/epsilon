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
Station.create(call_letters: "WBRS", location: "Waltham, MA", bio: "Test bio")

s = Station.find(1)

(1..6).each do |index|
	f_name = Faker::Name.first_name
	d_name = Faker::Name.title
	l_name = Faker::Name.last_name
	em = Faker::Internet.email
	user = User.create! :email => em, :password => 'topsecret', :password_confirmation => 'topsecret', first_name: f_name, last_name: l_name,dj_alias: d_name, u_id: index
	s.users << user
end


user1 = User.create! :email => 'oscar.courchaine@gmail.com', :password => '12345678', :password_confirmation => '12345678', first_name: 'Oscar', last_name: 'Courchaine' ,dj_alias: 'DJ Pamela', u_id: 100
s.users << user1


(1..1000).each do |index|
  artist_name = Faker::Name.name

  Artist.create(name: artist_name, genre: genres.sample, id: index, bio: Faker::Lorem.paragraph)
  
  

  s.albums << Album.create(genre: genres.sample, location: locations.sample, artist_id: index, name: Faker::Commerce.product_name, released: Faker::Date.between(10.years.ago, Time.now), in_lib?:tf.sample, id: index)
  
   

  Song.create(title: Faker::Name.title, album_id: index, artist_id: index)

  StationAlbum.create(album_id: index)

  Song.create(title: Faker::Name.title, album_id: index, artist_id: index)




end


