class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :vote
      t.date :created_time
      t.string :content
      t.integer :question_id

      t.timestamps
    end
  end
end
