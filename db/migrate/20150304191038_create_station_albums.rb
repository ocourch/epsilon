class CreateStationAlbums < ActiveRecord::Migration
  def change
    create_table :station_albums do |t|
      t.string :station_id
      t.string :album_id

      t.timestamps null: false
    end
  end
end
