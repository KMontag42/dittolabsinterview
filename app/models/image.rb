# == Schema Information
#
# Table name: images
#
#  id             :integer          not null, primary key
#  source         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  favorite_count :integer
#

class Image < ActiveRecord::Base
  has_many :brand_images
  has_many :brands, through: :brand_images
end
