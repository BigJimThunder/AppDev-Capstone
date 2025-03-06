class CreateTags < ActiveRecord::Migration[7.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :clothing_tags_count

      t.timestamps
    end
  end
end
