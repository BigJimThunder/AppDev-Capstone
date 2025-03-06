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
end
