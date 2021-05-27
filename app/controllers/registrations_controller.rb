class RegistrationsController < Devise::RegistrationsController
  def index
    dist = params[:distance].to_i || 50

    # find user records within the distance of the latitude and longitude provided and with the specified printer type
    # ensure eager loading is implemented
    @nearby_owners = User.within_range(params[:latitude].to_f, params[:longitude].to_f, dist)
                         .where(printers: { printer_type: params[:printer_type]&.split(',') || %w[FDM SLA] })
                         .includes(:printers, :reviews, :profile_pic_blob, :profile_pic_attachment, :roles)
  end

  def show
    # redirect to sign up page unless logged in
    return redirect_to new_user_registration_path unless current_user

    # find and define user given their id
    @user = User.find(params[:id])
  end

  protected

  def update_resource(resource, params)
    # unless updating their password, allow user to update account details without needing to enter current password
    if params.dig(:user, :password).blank? && params.dig(:user, :password_confirmation).blank?
      resource.update_without_password(params.except(:password, :password_confirmation, :current_password))
    else
      super
    end
  end

  # keep the user on their account page after they update their account details
  def after_update_path_for(_resource)
    edit_user_registration_path
  end
end
