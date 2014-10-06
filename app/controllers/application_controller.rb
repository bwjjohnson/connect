class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  skip_filter :require_no_authentication

  #before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!

  def verify_admin_access
    unless @user == current_user || current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end

  protected

  class User::ParameterSanitizer < Devise::ParameterSanitizer
    def account_update
      default_params.permit(:id, :name, :email, :role, :password, 
        :password_confirmation, :current_password)
    end
  end

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super # Use the default one
    end
  end
end

