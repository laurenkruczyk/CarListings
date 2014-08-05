require 'spec_helper'

describe CarListing do
  it {should validate_presence_of(:color)}
  it {should validate_presence_of(:year)}
  it {should validate_presence_of(:mileage)}
  it {should ensure_inclusion_of(:year).in_array(CarListing::YEARS)}
  it {should have_valid(:year).when('1980', '2014')}
  it {should_not have_valid(:year).when('1970')}
  it {should belong_to(:manufacturer)}
end