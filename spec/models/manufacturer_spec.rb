require 'spec_helper'

describe Manufacturer do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:country)}
    it {should have_many(:car_listings)}
 

  it 'should nullify its dependents' do
    manufacturer = FactoryGirl.create(:manufacturer)
    car_listing = FactoryGirl.create(:car_listing, manufacturer: manufacturer)
    car_listing_count = CarListing.count
    expect(car_listing.manufacturer).to eql(manufacturer)
    manufacturer.destroy
    car_listing.reload
    expect(car_listing.manufacturer).to eql(nil)
    expect(CarListing.count).to eql(car_listing_count)
  end
end


  
