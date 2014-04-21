class AddCounterToAnswerIndexToAvotes < ActiveRecord::Migration
  def change
    add_column :answers, :voters_count, :integer

    add_index :avotes, :user_id
    add_index :avotes, :answer_id
    add_index :avotes, [:user_id, :answer_id], unique: true
  end
end
