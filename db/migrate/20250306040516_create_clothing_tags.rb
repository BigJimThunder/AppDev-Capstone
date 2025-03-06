class CreateClothingTags < ActiveRecord::Migration[7.1]
  def change
    create_table :clothing_tags do |t|
      t.integer :clothing_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
