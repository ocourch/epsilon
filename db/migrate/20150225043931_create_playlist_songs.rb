class CreatePlaylistSongs < ActiveRecord::Migration
  def change
    create_table :playlist_songs do |t|
      t.string :song_id
      t.string :playlist_id

      t.timestamps null: false
    end
  end
end
