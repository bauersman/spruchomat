class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :uuid
      t.string :remoteip

      t.timestamps
    end
  end
end
