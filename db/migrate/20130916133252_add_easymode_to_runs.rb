class AddEasymodeToRuns < ActiveRecord::Migration
  def change
    add_column :runs, :easymode, :boolean, default: false
  end
end
