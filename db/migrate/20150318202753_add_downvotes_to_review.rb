class AddDownvotesToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :downvotes, :integer
  end
end
