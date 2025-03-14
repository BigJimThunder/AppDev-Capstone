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
  #Direct Associations
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true
  belongs_to :favoritable, polymorphic: true
end
