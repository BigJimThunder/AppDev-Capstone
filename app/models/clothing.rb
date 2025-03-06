# == Schema Information
#
# Table name: clothings
#
#  id                 :bigint           not null, primary key
#  brand              :string
#  category           :string
#  color              :string
#  image              :string
#  material           :string
#  outfit_items_count :integer
#  season             :string
#  size               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#
class Clothing < ApplicationRecord
  #Direct Associations
  has_many  :outfit_items, class_name: "OutfitItem", foreign_key: "clothing_id", dependent: :destroy
  has_many  :clothing_tags, class_name: "ClothingTag", foreign_key: "clothing_id", dependent: :destroy
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: :clothes_count

  #Indirect Associations
  has_many :outfits, through: :outfit_items, source: :outfit
  has_many :tags, through: :clothing_tags, source: :tag
end
