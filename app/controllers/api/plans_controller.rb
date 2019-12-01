module Api
  class PlansController < ApplicationController
    def show
      @plan = Plan.find(params[:id])
      render json: @plan

    def index
      @plans = Plan.all
      render json: @plans
    end
  end
end