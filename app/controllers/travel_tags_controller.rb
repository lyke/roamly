class TravelTagsController < ApplicationController
  def new
    @travel_tag = TravelTag.new
  end

  def create
    @travel_tag = TravelTag.new(travel_tag_params)
    if @travel_tag.save
      redirect_to travel_tag_url(@travel_tag), notice: "Place tag was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def travel_tag_params
    params.require(:travel_tag).permit(:name)
  end
end
