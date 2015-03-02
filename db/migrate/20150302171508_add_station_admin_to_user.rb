class AddStationAdminToUser < ActiveRecord::Migration
  def change
    add_column :users, :station_admin, :boolean
  end
end
