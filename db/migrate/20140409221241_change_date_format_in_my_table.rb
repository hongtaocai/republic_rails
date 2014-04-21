class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def change
    change_column :questions, :created_time, :datetime
  end
end
