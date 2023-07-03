class PagesController < ApplicationController
  before_action :set_travels, only: %i[ dashboard past_dashboard ]
  def home
  end

  def dashboard
  end

  def past_dashboard
  end

  def secret_spot
    @my_secrets = Place.where(user: current_user)
  end

  private

  def set_travels
    @travels = Travel.all
    @my_travels = Travel.where(user: current_user)
    @future_travels = []
    @past_travels = []
    # .flatten
    @my_travels.each do |my_travel|
      if my_travel.ending_date >= Date.today
        @future_travels << my_travel
      else
        @past_travels << my_travel
      end
    end
  end
end
