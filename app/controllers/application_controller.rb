class ApplicationController < ActionController::Base

  include Pundit
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << :name
    devise_parameter_sanitizer.for(:account_update) << :role
    devise_parameter_sanitizer.for(:account_update) << :specialization_id
    devise_parameter_sanitizer.for(:account_update) << :avatar
    devise_parameter_sanitizer.for(:account_update) << :vmilists

    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :role
    devise_parameter_sanitizer.for(:sign_up) << :specialization_id
    devise_parameter_sanitizer.for(:sign_up) << :avatar
    devise_parameter_sanitizer.for(:sign_up) << :vmilists
  end

  private

  def user_not_authorized
    redirect_to action: :error_403, controller: :error
  end
end
