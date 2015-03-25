class Station < ActiveRecord::Base
  has_and_belongs_to_many :albums
  has_and_belongs_to_many :users
  has_many :reviews, through: :users
end
