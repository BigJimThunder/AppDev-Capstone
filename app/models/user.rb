# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  clothes_count          :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  favorites_count        :integer
#  name                   :string
#  outfits_count          :integer
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  wardrobes_count        :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #Direct Associations
  has_many  :wardrobes, class_name: "Wardrobe", foreign_key: "user_id", dependent: :destroy
  has_many  :favorites, class_name: "Favorite", foreign_key: "user_id", dependent: :destroy
  has_many  :outfits, class_name: "Outfit", foreign_key: "user_id", dependent: :destroy
  has_many  :clothes, class_name: "Clothing", foreign_key: "user_id", dependent: :destroy
end
