class AddLocationToStationAlbum < ActiveRecord::Migration
  def change
    add_column :station_albums, :location, :string
  end
end
