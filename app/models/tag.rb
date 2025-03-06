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
end
