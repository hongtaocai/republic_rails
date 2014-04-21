class ChangeQuestionColumnName < ActiveRecord::Migration
  def change
    rename_column :answers, :question_id, :question_id
  end
end
