# == Schema Information
#
# Table name: favorites
#
#  id               :bigint           not null, primary key
#  favoritable_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  favoritable_id   :integer
#  user_id          :integer
#
class Favorite < ApplicationRecord
end
