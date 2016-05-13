# == Schema Information
#
# Table name: brands
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Brand < ActiveRecord::Base
  has_many :brand_images
  has_many :images, through: :brand_images

  def neighbor_brands
    nbs = []
    images.each do |i|
      nbs = nbs + i.brands
      nbs = nbs.uniq
    end
    nbs
  end
end
