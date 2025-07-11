class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  # 👇 ADD THIS METHOD TO PREVENT SESSION ERRORS IN API MODE
  def request_format
    request.format = :json
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
  end
end
