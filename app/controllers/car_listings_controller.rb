class CarListingsController < ApplicationController

  def index
    @car_listings = CarListing.all
  end

  def new
    @car_listing = CarListing.new
  end

  def create
    @car_listing = CarListing.new(car_listing_params)
    if @car_listing.save
      redirect_to new_car_listing_url, notice: 'Successfully created car listing'
    else
      render 'new'
    end

  def show
    @car_listing = CarListing.find(params[:id])
  end
end

  private
  def car_listing_params
    params.require(:car_listing).permit(:color, :year, :mileage, :description, :manufacturer_id)
  end
end