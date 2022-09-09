class RegistrationsController < Devise::RegistrationsController
  protected

  def after_inactive_sign_up_path_for(_e)
    new_user_session_path
  end
end
