class CreateClothings < ActiveRecord::Migration[7.1]
  def change
    create_table :clothings do |t|
      t.integer :user_id
      t.string :category
      t.string :color
      t.string :material
      t.string :season
      t.string :image
      t.string :brand
      t.string :size
      t.integer :outfit_items_count

      t.timestamps
    end
  end
end
