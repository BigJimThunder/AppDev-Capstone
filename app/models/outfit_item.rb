# == Schema Information
#
# Table name: outfit_items
#
#  id          :bigint           not null, primary key
#  position    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  clothing_id :integer
#  outfit_id   :integer
#
class OutfitItem < ApplicationRecord
  #Direct Associations
  belongs_to :clothes, required: true, class_name: "Clothing", foreign_key: "clothing_id", counter_cache: true
  belongs_to :outfit, required: true, class_name: "Outfit", foreign_key: "outfit_id"
end
