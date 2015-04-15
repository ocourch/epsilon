class Song < ActiveRecord::Base
  searchkick word_start: [:title]
  belongs_to :album
  belongs_to :user
  belongs_to :artist
end
