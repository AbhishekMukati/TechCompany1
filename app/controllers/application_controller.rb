class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_request
  protected

  def authorize_admin!
    unless current_user.admin?
      flash[:alert] = "You are not authorized to access this page."
      redirect_to root_path
    end
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || products_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password])
  end

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      decoded = JWT.decode(header, Rails.application.secrets.secret_key_base)
      @current_user = User.find(decoded[0]['user_id'])
    rescue JWT::DecodeError
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end
end
