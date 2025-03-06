class CreateWardrobeOutfits < ActiveRecord::Migration[7.1]
  def change
    create_table :wardrobe_outfits do |t|
      t.integer :wardrobe_id
      t.integer :outfit_id

      t.timestamps
    end
  end
end
