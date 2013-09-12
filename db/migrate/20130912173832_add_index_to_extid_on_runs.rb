class AddIndexToExtidOnRuns < ActiveRecord::Migration
  def change
    add_index :runs, :extid, unique: true
  end
end
