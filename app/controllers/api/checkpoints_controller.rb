module Api
  class CheckpointsController < ApplicationController
    def show
      render json: Checkpoint.find(params[:id]).get_nested_checkpoints
    end
  end
end
