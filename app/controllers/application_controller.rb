class ApplicationController < ActionController::API
  # before_action :doorkeeper_authorize! # equivalent of authenticate_user!

  private
  def current_resource_owner
    @current_resource_owner ||= User.find(doorkeeper_token[:resource_owner_id])
  end
end
