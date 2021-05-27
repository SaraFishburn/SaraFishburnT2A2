class ApplicationController < ActionController::Base

  # make sure user is logged in before they can access functionality
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # sanitize additional parameters that have been added to the devise users table
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name nickname])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[first_name last_name nickname latitude longitude address
                                               suburb_and_postcode rating profile_pic])
  end
end
