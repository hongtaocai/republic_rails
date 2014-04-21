class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.string :author
      t.string :abstract
      t.integer :rating
      t.string :google_url
      t.string :journal

      t.timestamps
    end
  end
end
