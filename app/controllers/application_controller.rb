class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def require_user
    unless current_user
      redirect_to get_started_path
    end
  end
  
  private
  
  # Set client
  def set_client
    @client = current_user
  end

  protected

  def configure_permitted_parameters
    # Permit the `subscribe_newsletter` parameter along with the other
    # sign up parameters.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
