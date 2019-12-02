class ApplicationController < ActionController::API
  before_action :doorkeeper_authorize! # equivalent of authenticate_user!

  private
  def current_resourse_owner
    @current_resourse_owner ||= User.find(doorkeeper_token[:resource_owner_id])
  end
end
