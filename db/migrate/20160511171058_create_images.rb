class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :source

      t.timestamps null: false
    end
  end
end
