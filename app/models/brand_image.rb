# == Schema Information
#
# Table name: brand_images
#
#  id            :integer          not null, primary key
#  brand_id      :integer
#  image_id      :integer
#  match_quality :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class BrandImage < ActiveRecord::Base
  belongs_to :brand
  belongs_to :image
end
