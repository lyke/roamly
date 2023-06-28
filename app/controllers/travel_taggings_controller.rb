class TravelTaggingsController < ApplicationController
  def new
    @travel_tagging = TravelTagging.new
  end

  def create
    @travel_tagging = TravelTagging.new
    @travel_tagging.travel_id = params[:travel_id]
    @travel_tagging.travel_tag_id = params[:travel_tag_id]
    if @travel_tagging.save
      redirect_to notice: "Travel tagging was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
end
