class TravelsController < ApplicationController
  before_action :set_travel, only: %i[ show edit update destroy ]

  def show
    @travel = Travel.find(params[:id])
  end

  def new
    @travel = Travel.new
  end

  def create
    @travel = Travel.new(travel_params)
    @travel.user_id = current_user.id

    @tags = TravelTag.where(id: params[:travel][:travel_tag_ids])
    @tags.each do |tag|
      travel_tagging = TravelTagging.new(travel_tag: tag, travel: @travel)
      travel_tagging.save!
    end
    @trav_type = TravTravTypeTag.where(id: params[:travel][:trav_trav_type_tag_ids])
    @trav_type.each do |trav_type|
      travel_type_tagging = TravTravTagging.new(trav_trav_type_tag: trav_type, travel: @travel)
      travel_type_tagging.save!
    end

    @places = Place.where(id: params[:travel][:place_ids])
    @places.each do |place|
      step = Step.new(place: place, travel: @travel)
      step.save!
    end

    if @travel.save!
      redirect_to dashboards_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @travel.update(travel_params)
    redirect_to travel_path(@travel)
  end

  def destroy
    @travel.destroy(travel_params)
    redirect_to travel_path, status: :see_other
  end

  private

  def set_travel
    @travel = Travel.find(params[:id])
  end

  def travel_params
    params.require(:travel).permit(:beginning_date, :ending_date, :nb_traveler, :incl_secret, :budget, :touristic, :starting_point, :start_hour, :end_hour, :name)
  end
end
