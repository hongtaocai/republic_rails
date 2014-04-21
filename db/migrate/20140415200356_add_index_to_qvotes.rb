class AddIndexToQvotes < ActiveRecord::Migration
  def change
    add_index :qvotes, :question_id
    add_index :qvotes, :user_id
    add_index :qvotes, [:question_id, :user_id], unique: true
  end
end
