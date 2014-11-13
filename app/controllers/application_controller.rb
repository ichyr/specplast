class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << :role
    devise_parameter_sanitizer.for(:account_update) << :specialization_id
    devise_parameter_sanitizer.for(:account_update) << :avatar
  end

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
