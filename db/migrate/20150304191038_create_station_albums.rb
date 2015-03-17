class CreateStationAlbums < ActiveRecord::Migration
  def change
    create_table :station_albums do |t|
      t.integer :station_id
      t.integer :album_id

      t.timestamps null: false
    end
  end
end
