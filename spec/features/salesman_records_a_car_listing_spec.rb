require 'spec_helper'

feature 'recording a newly acquired car', %q(
As a car salesperson
I want to record a newly acquired car
So that I can list it in my lot
) do

# Acceptance Criteria:

# I must specify the color, year, and mileage of the car.
# Only years from 1980 and above can be specified.
# I can optionally specify a description of the car.
# If I enter all of the required information in the required formats, the car is recorded.
# If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
# Upon successfully creating a car, I am redirected so that I can create another car.

  scenario 'creating a car listing' do
    visit new_car_listing_url
    expect(page).to have_content('Create a new car listing')
    fill_in 'Color', with: 'Black'
    select '1997', from: 'Year'
    fill_in 'Mileage', with: '120000'

    click_on 'Create Car Listing'
    expect(page).to have_content('Successfully created car listing')
    expect(current_path).to eql(new_car_listing_path)
  end
end