class PlacesController < ApplicationController
  before_action :set_place, only: %i[ show edit update destroy ]

  def index
    @places = Place.all
    @markers = @places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude
      }
    end
  end

  def show
    @marker = [{ lat: @place.latitude, lng: @place.longitude }]
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    @place.touristic = false
    if @place.save!
      redirect_to place_path(@place), notice: "Place was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @place.update(place_params)
      redirect_to place_path(@place), notice: "Place was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @place.destroy
    redirect_to places_path, notice: "Place was successfully destroyed."
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :description, :address, :price, :duration, :min_temp, :max_temp, :photo)
  end
end
