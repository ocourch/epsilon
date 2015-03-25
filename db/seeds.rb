# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

genres = ['Blues', 'Folk', 'Rock', 'Pop', 'Metal', 'Electronic', 'Jazz', 'Rap']
tf = [true, false]

(1..1000).each do |index|
  artist_name = Faker::Name.name

  Artist.create(name: artist_name, genre: genres.sample, id: index, bio: Faker::Lorem.paragraph)
  
  Album.create(artist_id: index, name: Faker::Commerce.product_name, released: Faker::Date.between(10.years.ago, Time.now), in_lib?:tf.sample, id: index)
  
  Song.create(title: Faker::Name.title, album_id: index, artist_id: index)

  StationAlbum.create(album_id: index)

  Station.create
end


User.create(first_name: "Ronald", last_name: "McDonald", email: "burgers@me.com")
  
