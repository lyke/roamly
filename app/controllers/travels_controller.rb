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
  
end
