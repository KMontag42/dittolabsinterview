class AddFavoriteCountToImage < ActiveRecord::Migration
  def change
    add_column :images, :favorite_count, :integer
  end
end
