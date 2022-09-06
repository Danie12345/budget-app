class ApplicationController < ActionController::Base
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
end
