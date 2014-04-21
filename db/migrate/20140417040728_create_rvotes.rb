class CreateRvotes < ActiveRecord::Migration
  def change
    create_table :rvotes do |t|
      t.integer :user_id
      t.integer :review_id

      t.timestamps
    end
  end
end
