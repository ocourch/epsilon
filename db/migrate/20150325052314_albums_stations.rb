class AlbumsStations < ActiveRecord::Migration
  def change
    create_table :albums_stations, id:false do |t|
      t.integer :album_id
      t.integer :station_id
    end
  end
end
