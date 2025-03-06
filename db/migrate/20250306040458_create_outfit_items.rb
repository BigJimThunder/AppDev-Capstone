class CreateOutfitItems < ActiveRecord::Migration[7.1]
  def change
    create_table :outfit_items do |t|
      t.integer :clothing_id
      t.integer :outfit_id
      t.string :position

      t.timestamps
    end
  end
end
