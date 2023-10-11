class StepsController < ApplicationController
  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    @step.save!
  end

  private

  def step_params
    params.require(:step).permit(:name)
  end
end
