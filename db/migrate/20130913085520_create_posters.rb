class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.references :party
      t.string :url
      t.text :text

      t.timestamps
    end
  end
end
