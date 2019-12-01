Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users

  use_doorkeeper do
    skip_controllers :authorizations, :applications,
      :authorized_applications
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :plans
    resources :users
  end
end
