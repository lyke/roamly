class PlaceTagsController < ApplicationController
  def index
    @tags = PlaceTag.all
  end

  def new
    @tag = PlaceTag.new
  end

  def create
    @tag = PlaceTag.new(place_traveler_type_tag_params)
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
    @place__tag = PlaceTag.find(params[:id])
  end

  def place_traveler_type_tag_params
    params.require(:place_traveler_type_tag).permit(:tag)
  end
end
