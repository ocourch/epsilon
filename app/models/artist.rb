class Artist < ActiveRecord::Base
  searchkick word_start: [:name]
  has_many :albums
end
