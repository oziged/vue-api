# app/controllers/registrations_controller.rb
class CustomDevise::ConfirmationsController < Devise::ConfirmationsController
  # skip_before_action :doorkeeper_authorize!

  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?
    redirect_to "http://www.rubyonrails.org"
    if resource.errors.empty?
      set_flash_message!(:notice, :confirmed)
      # respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
    else
      # respond_with_navigational(resource.errors, status: :unprocessable_entity){ render :new }
    end
  end
end 