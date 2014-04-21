class ChangeAbstractColumnType < ActiveRecord::Migration
  def change
    change_column :publications, :abstract, :text
  end
end
