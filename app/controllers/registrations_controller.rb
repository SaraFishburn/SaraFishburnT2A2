class RegistrationsController < Devise::RegistrationsController
  def index
    dist = params[:dist] || 50
    @address = params[:address]
    @nearby_owners = User.within_range(params[:latitude].to_f, params[:longitude].to_f, dist)
  end

  def show
  end

  protected

  def update_resource(resource, params)
    if params.dig(:user, :password).blank? && params.dig(:user, :password_confirmation).blank?
      resource.update_without_password(params)
    else
      super
    end
  end

  def after_update_path_for(_resource)
    edit_user_registration_path
  end
end
