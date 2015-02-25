class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :artist_id
      t.string :album_id
      t.date :released
      t.string :record_label
      t.string :genre

      t.timestamps null: false
    end
  end
end
