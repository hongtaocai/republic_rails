class AddCounterCacheToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :voters_count, :integer
  end
end
