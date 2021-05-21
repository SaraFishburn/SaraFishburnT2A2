class OwnersController < ApplicationController
  before_action :public_name, only: %i[show]

  def show
    @owner = User.find(params[:id])
    @printers = Printers.find(:all, conditions: ['owner_id = ?', @owner.id])
  end

  private

  def suburb
    # use geocoding to find suburb from saved latitude and longitude
  end

  def public_name
    @owner = User.find(params[:id])
    @public_name = @owner.nickname || @public_name = @owner.first_name
  end
end
