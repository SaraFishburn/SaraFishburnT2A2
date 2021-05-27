class ReviewsController < ApplicationController
  def create
    # unless the user hasnt reviewed the owner before, redirect to the owner's profile
    # to check if they've reviewed, try to find all reviews they have made that contain the owner's id,
    # if list is empty, they haven't made a review.
    unless current_user.reviews_made.where(user_id: params[:user_id]).empty?
      return redirect_to users_show_path(params[:user_id])
    end

    # create a review record given the parameters
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
