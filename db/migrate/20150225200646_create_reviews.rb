class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :user_id
      t.string :album_id
      t.text :text
      t.integer :upvotes
      t.integer :downvotes

      t.timestamps null: false
    end
  end
end
