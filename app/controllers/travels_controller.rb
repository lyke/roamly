class TravelsController < ApplicationController
  def show
    @travel = Travel.find(params[:id])
  end

  def new
    @travel = Travel.new
  end

  def create
    @travel = Travel.new(travel_params)
    @travel.user_id = current_user.id
    # price
    if @travel.save
      redirect_to dashboards_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_travel
    @travel = Travel.find(params[:id])
  end

  def travel_params
    params.require(:travel).permit(:beginning_date, :ending_date, :nb_traveler, :incl_secret, :budget, :touristic, :starting_point, :start_hour, :end_hour)
  end



end
