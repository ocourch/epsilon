class StationAlbum < ActiveRecord::Base
    belongs_to :station
    has_one :album
end
