namespace :load do
  task :images => :environment do
    # load the .json file
    # break it out line by line
    # for each line, JSON.parse
    # for each line, create an image
    # for each brand, `find_or_create_by(name:)`
    # for each match, create the join link, add quality of match
    raw_data = File.read("#{Rails.root}/lib/assets/bostonmarathon_photos.json")
    line_data = raw_data.split("\n")
    line_data.each do |line|
      line_json = JSON.parse(line)
      line_image = Image.create({
        source: line_json['matches']['url'],
        favorite_count: line_json['post']['likes']['count']
      })
      line_brands = line_json['matches']['data']['matches']
      line_brands.each do |lb|
        brand = Brand.find_or_create_by(name: lb['brand'])
        match = BrandImage.create({
          image_id: line_image.id,
          brand_id: brand.id,
          match_quality: lb['match_quality']
        })
      end
    end
  end
end