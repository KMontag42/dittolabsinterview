class BrandImage < ActiveRecord::Base
  belongs_to :brand
  belongs_to :image
end
