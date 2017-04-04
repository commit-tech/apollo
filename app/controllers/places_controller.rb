class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    Place.new(place_params)
  end

  def edit
    @places = Place.find(params[:id])
  end

  def update
    Place.update(params[:place])
  end

  def destroy
    Place.find(params[:id]).destroy
    redirect_to :index
  end

  private

  def place_params
    params.require(:place).permit(:name)
  end
end
