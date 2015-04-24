class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :dj_alias
      t.boolean :site_admin
      t.integer :station_id
      t.string :byline
      t.string :bio
      
      t.timestamps null: false
    end
  end
end
