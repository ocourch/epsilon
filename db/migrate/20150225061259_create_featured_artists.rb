class CreateFeaturedArtists < ActiveRecord::Migration
  def change
    create_table :featured_artists do |t|
      t.string :artist_id
      t.string :song_id

      t.timestamps null: false
    end
  end
end
