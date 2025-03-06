# == Schema Information
#
# Table name: wardrobe_outfits
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  outfit_id   :integer
#  wardrobe_id :integer
#
class WardrobeOutfit < ApplicationRecord
  #Direct Associations
  belongs_to :outfits, required: true, class_name: "Outfit", foreign_key: "outfit_id", counter_cache: true
  belongs_to :wardrobes, required: true, class_name: "Wardrobe", foreign_key: "wardrobe_id", counter_cache: true
end
