class AddIndexToVoteAction < ActiveRecord::Migration
  def change
    add_index :voteactions, :publication_id
    add_index :voteactions, :user_id
    add_index :voteactions, [:publication_id, :user_id], unique: true

  end
end
