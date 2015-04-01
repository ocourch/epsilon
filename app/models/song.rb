class Song < ActiveRecord::Base
  searchkick text_start: [:title]
  belongs_to :album
  belongs_to :user
end
