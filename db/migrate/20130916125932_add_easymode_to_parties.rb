class AddEasymodeToParties < ActiveRecord::Migration
  def change
    add_column :parties, :easymode, :boolean
    add_index :parties, :easymode
  end
end
