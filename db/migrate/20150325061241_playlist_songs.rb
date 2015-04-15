class PlaylistSongs < ActiveRecord::Migration
  def change
    create_table :playlist_songs, id:false do |t|
      t.integer :playlist_id
      t.integer :song_id
      t.datetime :time_played
    end
  end
end
