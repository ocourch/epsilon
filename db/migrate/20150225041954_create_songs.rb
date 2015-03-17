class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :artist_id
      t.integer :contributing_artists
      t.integer :album_id
      t.string :title
      t.time :duration

      t.timestamps null: false
    end
  end
end
