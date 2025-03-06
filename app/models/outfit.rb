# == Schema Information
#
# Table name: outfits
#
#  id                     :bigint           not null, primary key
#  name                   :string
#  wardrobe_outfits_count :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_id                :integer
#
class Outfit < ApplicationRecord
  #Direct Associations
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true
  has_many  :outfit_items, class_name: "OutfitItem", foreign_key: "outfit_id", dependent: :destroy
  has_many  :wardrobe_outfits, class_name: "WardrobeOutfit", foreign_key: "outfit_id", dependent: :destroy

  #Indirect Associations
  has_many :clothes, through: :outfit_items, source: :clothes
  has_many :wardrobes, through: :wardrobe_outfits, source: :wardrobes
end
