class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :user_id
      t.string :title
      t.string :show_name
      t.datetime :played_at

      t.timestamps null: false
    end
  end
end
