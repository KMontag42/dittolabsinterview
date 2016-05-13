class AddDatePostedToImage < ActiveRecord::Migration
  def change
    add_column :images, :date_posted, :datetime
  end
end
