Rails.application.routes.draw do
  get 'authentication/authenticate'
  devise_for :users

  # Routes accessible only to signed-in users
  authenticated :user do
    resources :categories
    resources :products
  end

  # Define other routes accessible to all users

  # Define the root path route ("/")
  root to: redirect('/users/sign_in')
  # delete '/users/sign_out' => 'application#sign_out_user', as: :sign_out
  devise_scope :user do
    delete '/users/sign_out' => 'devise/sessions#destroy', as: :custom_destroy_user_session
  end
end
