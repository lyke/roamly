class PlaceTravelerTypeTagsController < ApplicationController
  before_action :set_place_traveler_type_tag, only: %i[ destroy ]

  def index
    @tags = PlaceTravelerTypeTag.all
  end

  def new
    @tag = PlaceTravelerTypeTag.new
  end

  def create
    @tag = PlaceTravelerTypeTag.new(place_traveler_type_tag_params)
    if @tag.save!
      redirect_to place_traveler_type_tags_path, notice: "Place was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @place_traveler_type_tag.destroy
    redirect_to place_traveler_type_tags_path, notice: "Place was successfully destroyed."
  end

  private

  def set_place_traveler_type_tag
    @place_traveler_type_tag = PlaceTravelerTypeTag.find(params[:id])
  end

  def place_traveler_type_tag_params
    params.require(:place_traveler_type_tag).permit(:tag)
  end
end
