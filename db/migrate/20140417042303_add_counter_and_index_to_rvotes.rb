class AddCounterAndIndexToRvotes < ActiveRecord::Migration
  def change
    add_column :reviews, :voters_count, :integer

    add_index :rvotes, :user_id
    add_index :rvotes, :review_id
    add_index :rvotes, [:user_id, :review_id], unique: true
  end
end
