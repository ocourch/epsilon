class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :call_letters
      t.string :location
      t.string :bio
      t.string :website

      t.timestamps null: false
    end
  end
end
