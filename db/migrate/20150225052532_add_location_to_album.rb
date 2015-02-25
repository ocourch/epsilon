class AddLocationToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :location, :string
  end
end
