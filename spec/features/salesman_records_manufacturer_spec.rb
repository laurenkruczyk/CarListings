require 'spec_helper'

feature 'recording a manufacturer', %q{
As a car salesperson
I want to record a car manufacturer
So that I can keep track of the types of cars found in the lot
} do

#Acceptance Criteria:

# I must specify a manufacturer name and country.
# If I do not specify the required information, I am presented with errors.
# If I specify the required information, the manufacturer is recorded and I am redirected to enter another new manufacturer.

  scenario 'creating a manufacturer' do
    visit new_manufacturer_path
    fill_in 'Name', with: 'Ford'
    select 'United States', from: 'Country'

    click_on 'Create Manufacturer'
    expect(page).to have_content('Successfully created manufacturer')
    expect(current_path).to eql(new_manufacturer_path)
  end
end

