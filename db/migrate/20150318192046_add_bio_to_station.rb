class AddBioToStation < ActiveRecord::Migration
  def change
    add_column :stations, :bio, :string
  end
end
