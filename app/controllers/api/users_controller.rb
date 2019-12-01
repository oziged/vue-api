module Api
  class UsersController < ApplicationController
    skip_before_action :doorkeeper_authorize!

    def create
      render json: User.create!(user_params), status: :created
    end

    private
    def user_params
      params.permit(:login, :email, :password, :password_confirmation)
    end
  end
end