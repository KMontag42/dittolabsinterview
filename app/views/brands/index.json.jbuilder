json.array!(@brands) do |brand|
  json.extract! brand, :id
  json.name brand.name.titleize
  json.image_count brand.images.count
  json.url brand_url(brand)
end
