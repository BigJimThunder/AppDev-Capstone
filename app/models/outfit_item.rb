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
end
