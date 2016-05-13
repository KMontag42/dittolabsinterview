json.array!(@neighbors) do |brand|
  json.extract! brand, :id
  json.name brand.name.titleize
  json.url brand_url(brand)
end