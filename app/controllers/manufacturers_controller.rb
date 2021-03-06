class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.all
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      redirect_to new_manufacturer_url, notice: 'Successfully created manufacturer'
    else
      render 'new'
    end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end
end

  private
  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end

