module Api
  class PlansController < ApplicationController

    def show
      @plan = Plan.find(4)
      puts @plan.inspect
      render json: @plan
    end

    def index
      @plans = Plan.all
      render json: @plans
    end
  end
end