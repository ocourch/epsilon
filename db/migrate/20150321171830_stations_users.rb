class StationsUsers < ActiveRecord::Migration
  def change
    create_table :stations_users do |t|
      t.integer :station_id
      t.integer :user_id
      t.boolean :station_admin
    end
  end
end
