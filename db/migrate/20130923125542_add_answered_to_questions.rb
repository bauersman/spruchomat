class AddAnsweredToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answered, :boolean, default: false
    add_index :questions, :answered
  end
end
