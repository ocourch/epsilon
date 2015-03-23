class Station < ActiveRecord::Base
  has_many :station_albums
  has_many :albums, through: :station_albums
  has_and_belongs_to_many :users
  has_many :reviews, through: :users
end
