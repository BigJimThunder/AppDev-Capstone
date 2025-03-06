# == Schema Information
#
# Table name: clothing_tags
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  clothing_id :integer
#  tag_id      :integer
#
class ClothingTag < ApplicationRecord
  #Direct Associations
  belongs_to :clothes, required: true, class_name: "Clothing", foreign_key: "clothing_id"
  belongs_to :tag, required: true, class_name: "Tag", foreign_key: "tag_id", counter_cache: true
end
