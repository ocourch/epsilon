class AddLastFmToSong < ActiveRecord::Migration
  def change
    add_column :songs, :lastfm_id, :string
  end
end
