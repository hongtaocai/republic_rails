class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :publication_id

      t.timestamps
    end

    add_index :reviews, :user_id
    add_index :reviews, :publication_id

  end
end
