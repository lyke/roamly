class TravTravTypeTagsController < ApplicationController
  def new
    @trav_trav_type_tag = TravTravTypeTag.new
  end

  def create
    @trav_trav_type_tag = TravTravTypeTag.new(trav_trav_type_tag_params)
    if @trav_trav_type_tag.save
      redirect_to  notice: "trav_trav_type_tag was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
end
