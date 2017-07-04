class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CanCan::ControllerAdditions
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys:[:phone, :user_roles])
    devise_parameter_sanitizer.permit(:sign_up, keys:[:phone, :user_roles])
  end
end
