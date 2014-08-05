class AddCarListingToManufacturer < ActiveRecord::Migration
  def change
    add_column :car_listings, :manufacturer_id, :integer
    add_index :car_listings, :manufacturer_id
  end
end
