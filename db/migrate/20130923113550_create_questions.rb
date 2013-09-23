class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :run, index: true
      t.references :poster, index: true
      t.references :answered_party, index: true
      t.integer :position, limit: 1

      t.timestamps
    end
  end
end
