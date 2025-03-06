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
end
