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

      t.timestamps null: false
    end
  end
end
