# == Schema Information
#
# Table name: tags
#
#  id                  :bigint           not null, primary key
#  clothing_tags_count :integer
#  name                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Tag < ApplicationRecord
  #Direct Associations
  has_many  :clothing_tags, class_name: "ClothingTag", foreign_key: "tag_id", dependent: :destroy

  #Indirect Associations
  has_many :clothes, through: :clothing_tags, source: :clothes
end
