class CreateVoteactions < ActiveRecord::Migration
  def change
    create_table :voteactions do |t|
      t.belongs_to :user
      t.belongs_to :publication

      t.timestamps
    end
  end
end
