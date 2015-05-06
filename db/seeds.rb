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

Station.create(call_letters: "WBRS", location: "Waltham, MA", bio: "WBRS is the sole broadcasting entity at Brandeis University, dedicated to providing for the needs of its listeners in the areas of entertainment, information, and public service. WBRS also undertakes a wide variety of non-broadcasting services in order to diversify, improve, and advance broadcasting at Brandeis University. WBRS is the non-commercial student radio station licensed to Brandeis University in Waltham, Massachusetts. We broadcast 24/7/365 serving Brandeis University, Waltham and the surrounding communities. WBRS broadcasts with an ERP (effective radiated power) of 25 watts at an elevation of 46 meters HAAT (height above average terrain). Our facilities are located on the Brandeis campus with studios in the Shapiro Campus Center and transmitter on top of the Rabb Graduate Center. WBRS is licensed by the FCC as a Class D station, reaching Framingham and Natick to the west and as far as East Boston and Logan International Airport to the east.

WBRS’ motto is ‘Something for Everyone.’ We encourage all artists, labels, and radio services to contribute material for airplay. WBRS prides itself in also being able to provide Brandeis University’s student body with a diverse array of services including radio DJ training and certification, concerts and live music events, equipment rental, station education, and professional development for students interested pursuing careers in media or broadcasting. Although WBRS is entirely student -run, the station also reaches out to the greater Waltham area with shows run by community members and Brandeis faculty. Tune in today for the latest and greatest from WBRS 100.1 FM!")



s = Station.find(1)
#adds users to a station
(1..6).each do |index|
	f_name = Faker::Name.first_name
	d_name = "DJ " + Faker::Name.title
	l_name = Faker::Name.last_name
	em = Faker::Internet.email

end


#makes music and adds to station
(1..10).each do |index|
  artist_name = Faker::Name.name

  Artist.create(name: artist_name, genre: genres.sample, bio: Faker::Lorem.paragraph)

  s.albums << Album.create(genre: genres.sample, location: locations.sample, artist_id: index, name: Faker::Commerce.product_name, released: Faker::Date.between(10.years.ago, Time.now), in_lib?:tf.sample, image_url: "http://i.imgur.com/4BmxKxf.jpg?1")
  
  Song.create(title: Faker::Name.title, album_id: index, artist_id: index, duration: 555)

end


#adds Oscar as a user

user1 = User.create! :site_admin => true, :email => 'oscar.courchaine@gmail.com', :password => '12345678', :password_confirmation => '12345678', first_name: 'Oscar', last_name: 'Courchaine' ,dj_alias: 'DJ Pamela'

user2 = User.create! :site_admin => false, :email => 'jochs@brandeis.edu', :password => '12345678', :password_confirmation => '12345678', first_name: 'Jess', last_name: 'Ochs-Willard' ,dj_alias: 'DJ Flashy'

user3 = User.create! :site_admin => true, :email => 'ethteck@gmail.com', :password => 'asdfasdf', :password_confirmation => 'asdfasdf', first_name: 'Ethan', last_name: 'Roseman', dj_alias: 'DJ Moose'

#gives oscar playlists
(1..6).each do |index|
	p = Playlist.create(title: Faker::Commerce.product_name, user_id: user1.id)
	(1..6).each do |index|
		r = Random.new
		t = r.rand(150..350)
		p.songs << Song.create(title: Faker::Name.title, album_id: index, artist_id: index, duration: t)
	end
	p1 = Playlist.create(title: Faker::Commerce.product_name, user_id: user2.id)
	(1..6).each do |index|
		r = Random.new
		t = r.rand(150..350)
		p.songs << Song.create(title: Faker::Name.title, album_id: index, artist_id: index, duration: t)
	end
	p2 = Playlist.create(title: Faker::Commerce.product_name, user_id: user2.id)
	(1..6).each do |index|
		r = Random.new
		t = r.rand(150..350)
		p.songs << Song.create(title: Faker::Name.title, album_id: index, artist_id: index, duration: t)
	end
	user1.playlists << p
	user2.playlists << p1
	user3.playlists << p2
end

s.users << user1
s.users << user2
s.users << user3

Review.create(album_id: 1, user_id: 2, text: "test review")

# Resets table auto increment ID so seeding doesn't break everything
ActiveRecord::Base.connection.tables.each do |table|
  result = ActiveRecord::Base.connection.execute("SELECT id FROM #{table} ORDER BY id DESC LIMIT 1") rescue ( puts "Warning: not procesing table #{table}. Id is missing?" ; next )
  ai_val = result.any? ? result.first['id'].to_i + 1 : 1
  puts "Resetting auto increment ID for #{table} to #{ai_val}"
  ActiveRecord::Base.connection.execute("ALTER SEQUENCE #{table}_id_seq RESTART WITH #{ai_val}")
end