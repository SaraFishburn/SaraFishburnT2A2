class RegistrationsController < Devise::RegistrationsController
  def index
    dist = params[:distance].to_i || 50
    @address = params[:address]
    @nearby_owners = User.within_range(params[:latitude].to_f, params[:longitude].to_f, dist)
                         .where(printers: { printer_type: params[:printer_type]&.split(",") || %w[FDM SLA] })
                         .includes(:printers, :reviews, :profile_pic_blob, :profile_pic_attachment, :roles)
  end

  def show
    return redirect_to new_user_registration_path unless current_user

    @user = User.find(params[:id])
  end

  protected

  def update_resource(resource, params)
    puts params
    if params.dig(:user, :password).blank? && params.dig(:user, :password_confirmation).blank?
      params.delete(:password)
      params.delete(:confirm_password)
      params.delete(:current_password)
      # params.except(:password, :password_confirmation, :current_password) << this didnt work, not sure why
      resource.update_without_password(params)
    else
      super
    end
  end

  def after_update_path_for(_resource)
    edit_user_registration_path
  end
end
