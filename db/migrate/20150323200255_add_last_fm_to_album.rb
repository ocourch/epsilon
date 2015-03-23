class AddLastFmToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :lastfm_id, :string
  end
end
