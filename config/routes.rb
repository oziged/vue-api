Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users,
           :controllers  => {
             :registrations => 'custom_devise/registrations',
             :confirmations => 'custom_devise/confirmations'
           }

  use_doorkeeper do
    skip_controllers :authorizations, :applications,
      :authorized_applications
  end
  
  namespace :api do
    resources :plans
    resources :users
    resources :checkpoints
  end
end
