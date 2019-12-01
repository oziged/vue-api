class ApplicationController < ActionController::API
  before_action :doorkeeper_authorize! # equivalent of authenticate_user!
end
