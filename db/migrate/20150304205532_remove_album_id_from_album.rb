class RemoveAlbumIdFromAlbum < ActiveRecord::Migration
  def change
    remove_column :albums, :album_id
  end
end
