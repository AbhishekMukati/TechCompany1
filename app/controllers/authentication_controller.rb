# app/controllers/authentication_controller.rb
class AuthenticationController < ApplicationController
  def authenticate
    user = User.find_by(email: params[:email])
    if user && user.valid_password?(params[:password])
      token = JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base)
      render json: { token: token }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
