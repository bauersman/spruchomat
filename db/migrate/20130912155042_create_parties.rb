class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.string :homepage

      t.timestamps
    end
  end
end
