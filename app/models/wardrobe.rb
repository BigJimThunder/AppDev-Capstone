# == Schema Information
#
# Table name: wardrobes
#
#  id                     :bigint           not null, primary key
#  name                   :string
#  wardrobe_outfits_count :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_id                :integer
#
class Wardrobe < ApplicationRecord
end
