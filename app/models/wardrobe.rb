# == Schema Information
#
# Table name: wardrobes
#
#  id                     :bigint           not null, primary key
#  name                   :string
#  wardrobe_outfits_count :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_id                :integer
#
class Wardrobe < ApplicationRecord
  #Direct Associations
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true
  has_many  :wardrobe_outfits, class_name: "WardrobeOutfit", foreign_key: "wardrobe_id", dependent: :destroy

  #Indirect Associations
  has_many :outfits, through: :wardrobe_outfits, source: :outfits
end
