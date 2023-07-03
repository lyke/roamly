class PlacesController < ApplicationController
  before_action :set_place, only: %i[ show edit update destroy ]

  def index
    @places = policy_scope(Place)
    @markers = @places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {place: place})
      }
    end
    authorize @places
  end

  def show
    @marker = [{ lat: @place.latitude, lng: @place.longitude, info_window_html: render_to_string(partial: "info_window", locals: {place: @place}) }]
  end

  def new
    @place = Place.new
    authorize @place
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user

    @tags = PlaceTag.where(id: params[:place][:place_tag_ids])
    @tags.each do |tag|
      place_tagging = PlaceTagging.new(place_tag: tag, place: @place)
      place_tagging.save!
    end
    @place_type = PlaceTravelerTypeTag.where(id: params[:place][:place_traveler_type_tag_ids])
    @place_type.each do |place_type|
      place_traveler_type_tagging = PlaceTravelerTypeTagging.new(place_traveler_type_tag: place_type, travel: @place)
      place_traveler_type_tagging.save!
    end

    if @place.save!
      redirect_to place_path(@place), notice: "Place was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
    authorize @place
  end

  def edit
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
    redirect_to secret_spots_path, status: :see_other, notice: "Place was successfully destroyed."
  end

  private

  def set_place
    @place = Place.find(params[:id])
    authorize @place
  end

  def place_params
    params.require(:place).permit(:name, :description, :address, :price, :duration, :min_temp, :max_temp, :photos, :secret_spot, :touristic, :longitude, :latitude, :validation)
  end
end
