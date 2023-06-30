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
    @future_travels = []
    @past_travels = []
    # .flatten
    @travels.each do |travel|
      if travel.ending_date >= Date.today
        @future_travels << travel
      else
        @past_travels << travel
      end
    end
  end
end
