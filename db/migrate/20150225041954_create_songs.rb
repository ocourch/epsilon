class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist_id
      t.string :song_id
      t.string :artist_name
      t.string :title
      t.time :duration

      t.timestamps null: false
    end
  end
end
