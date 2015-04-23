class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :dj_alias
      t.boolean :site_admin
      t.integer :station_id
      
      t.timestamps null: false
    end
  end
end
