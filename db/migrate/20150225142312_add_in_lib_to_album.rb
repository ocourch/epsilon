class AddInLibToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :in_lib, :boolean
  end
end
