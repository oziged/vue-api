class PlansController < ApplicationController
  def show
    @plan = Plan.find(1)
    puts @plan.inspect
    render json: @plan
  end

  def index
    @plans = Plan.all
    render json: @plans
  end
end
