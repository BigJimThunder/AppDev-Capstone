class CreateWardrobes < ActiveRecord::Migration[7.1]
  def change
    create_table :wardrobes do |t|
      t.integer :user_id
      t.string :name
      t.integer :wardrobe_outfits_count

      t.timestamps
    end
  end
end
