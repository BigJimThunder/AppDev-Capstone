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
end
