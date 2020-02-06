module Api
  class CheckpointsController < ApplicationController
    def show
      render json: Checkpoint.find(params[:id]).get_nested_checkpoints
    end

    def create
      @plan = Plan.find(params[:plan_id])
      @user = User.find(1)

      @place = Place.new(place_params)
      if @place.save
        @checkpoint = @plan.checkpoints.create(checkpoint_params.merge!({user_id: 1, place_id: @place.id}))
        render json: @checkpoint
      else 
        raise "Place not saved"
      end

    rescue 
      render json: {
        error: "Something goes wrong"
      }, status: 404
    end

    private
    def place_params
      params.permit(:lat, :lng)
    end

    def checkpoint_params
      params.permit(:title, :description)
    end
  end
end
