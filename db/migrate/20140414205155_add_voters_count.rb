class AddVotersCount < ActiveRecord::Migration
  def change
      add_column :publications, :voters_count, :integer, default: 0
  end
end
