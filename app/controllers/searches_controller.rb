class SearchesController < ApplicationController
  # before_action: change string form address to lomg and lat 
  def index
    dist = params[:dist] || 50
    @address = params[:address]
    @nearby_owners = User.within_range(params[:latitude].to_f, params[:longitude].to_f, dist)
  end
end
