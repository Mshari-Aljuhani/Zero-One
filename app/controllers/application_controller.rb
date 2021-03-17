class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :is_admin!
  private
    def is_admin!
      if current_user && current_user.admin
      else
        redirect_to root_path
      end
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:avatar ,:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs

  end
end
