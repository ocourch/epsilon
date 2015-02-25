class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :u_id
      t.string :first_name
      t.string :last_name
      t.string :dj_alias
      t.string :station
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
