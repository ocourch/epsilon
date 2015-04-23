class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :artist_id
      t.date :released
      t.string :record_label
      t.string :genre
      t.string :location
      t.boolean :in_lib?
      t.string :name
      t.datetime :created_at
      t.string :image_url

      t.timestamps null: false
    end
  end
end
