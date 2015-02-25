class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :u_id
      t.string :playlist_id

      t.timestamps null: false
    end
  end
end
