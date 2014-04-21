class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :user_id
      t.integer :vote
      t.integer :publication_id
      t.date :created_time
      t.string :content

      t.timestamps
    end
  end
end
