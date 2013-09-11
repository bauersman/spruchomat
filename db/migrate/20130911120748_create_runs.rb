class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.references :session, index: true
      t.string :extid
      t.string :state
      t.text :data

      t.timestamps
    end
  end
end
