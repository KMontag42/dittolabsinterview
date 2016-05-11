class CreateBrandImages < ActiveRecord::Migration
  def change
    create_table :brand_images do |t|
      t.integer :brand_id
      t.integer :image_id
      t.string :match_quality

      t.timestamps null: false
    end
  end
end
