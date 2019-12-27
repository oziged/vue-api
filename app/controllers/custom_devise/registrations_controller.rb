# app/controllers/registrations_controller.rb
class CustomDevise::RegistrationsController < Devise::RegistrationsController
  # skip_before_action :doorkeeper_authorize!

  def create
    build_resource(sign_up_params)
    resource.save
    puts '*' *100
    puts resource.inspect
    puts resource.errors.inspect
    puts '*' *100
    # puts resource.active_for_authentication?
    yield resource if block_given?
    if resource.persisted?
    render json: resource, status: :created
    if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        # respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        # respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      # respond_with resource
      # render json: {
      #   error: 'already exist', 
      # }, status: 409
    end
  end

  private
  def sign_up_params
    params.permit(:login, :email, :password, :password_confirmation)
  end
end 