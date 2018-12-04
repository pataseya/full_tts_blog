class ApplicationController < ActionController::Base
  # This protect_from_forgery method leverages magic to ensure that your application is protected from hackers!
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar])

    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar])
  end
end
