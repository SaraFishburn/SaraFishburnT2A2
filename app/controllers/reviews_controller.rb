class ReviewsController < ApplicationController
  def create
    # unless the user hasnt reviewed the owner before, redirect to the owner's profile
    unless current_user.reviews_made.where(user_id: params[:user_id]).empty?
      return redirect_to users_show_path(params[:user_id])
    end

    current_user.reviews_made.create(review_params)
    redirect_to users_show_path(params[:user_id])
  end

  # nescessary for the 'new' view to work
  def new; end

  private

  def review_params
    params.permit(:user_id, :content, :rating)
  end
end
