class ApplicationController < ActionController::Base

  include Pundit
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.for(:account_update) { |u| 
      u.permit( :name, :email, :role,
                :specialization_id, :avatar, :vmilist_token,
                :city, :region, :description, :current_password,
                attachments_attributes: [:id, :file, :_destroy] )
    }

    devise_parameter_sanitizer.for(:sign_up) { |u| 
      u.permit( :name, :email, :role,
                :specialization_id, :avatar, :vmilist_token,
                :city, :region, :description, :current_password,
                attachments_attributes: [:id, :file, :_destroy] )
    }

  end

  private

  def user_not_authorized
    redirect_to action: :error_403, controller: :error
  end
end
