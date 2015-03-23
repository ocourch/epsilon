class AddLastFmToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :lastfm_id, :string
 end
end
