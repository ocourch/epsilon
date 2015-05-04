class AddImageUrlToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :image_url, :string
    add_column :albums, :image_url_large, :string
  end
end
