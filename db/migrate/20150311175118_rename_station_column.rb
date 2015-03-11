class RenameStationColumn < ActiveRecord::Migration
  def change
    rename_column :users, :station, :station_id
  end
end
