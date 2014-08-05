require 'spec_helper'

feature 'associating a car listing with a manufacturer' do
  
#Acceptance Criteria:

# When recording a car listing, I want to optionally associate it with its manufacturer.
# If I delete a manufacturer, the manufacturer and its primary key should no longer be associated with any car listings.

  scenario 'associate car listing with manufacturer' do
    manufacturer = FactoryGirl.create(:manufacturer)
    car_listing = FactoryGirl.build(:car_listing, manufacturer: nil)
    visit new_car_listing_url
    fill_in 'Color', with: car_listing.color
    select car_listing.year, from: 'Year'
    fill_in 'Mileage', with: car_listing.mileage
    select manufacturer.name, from: 'Manufacturer'
    click_on 'Create Car listing'

    expect(page).to have_content('Successfully created car listing')
    expect(CarListing.last.manufacturer).to eql(manufacturer)
    expect(manufacturer.car_listings).to include(CarListing.last)
  end
end