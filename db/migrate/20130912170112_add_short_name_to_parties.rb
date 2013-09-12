class AddShortNameToParties < ActiveRecord::Migration
  def change
    add_column :parties, :short_name, :string
  end
end
