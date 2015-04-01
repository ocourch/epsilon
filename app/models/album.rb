class Album < ActiveRecord::Base
  #searchkick word_start: [:name]
  has_many :songs
  belongs_to :artist
end
