class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :artist_id
      t.string :genre
      t.text :bio

      t.timestamps null: false
    end
  end
end
