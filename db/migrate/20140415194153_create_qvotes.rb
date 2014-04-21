class CreateQvotes < ActiveRecord::Migration
  def change
    create_table :qvotes do |t|
      t.integer :user_id
      t.integer :question_id

      t.timestamps
    end
  end
end
