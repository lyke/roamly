class TravTravTaggingsController < ApplicationController
  def new
    @trav_trav_tagging = TravTravTagging.new
  end

  def create
    @trav_trav_tagging = TravTravTagging.new
    @trav_trav_tagging.travel_id = params[:travel_id]
    @trav_trav_tagging.trav_trav_type_tag_id = params[:trav_trav_type_tag_id]
    if @trav_trav_tagging.save
      redirect_to notice: "trav_trav_tagging was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
end
