class ReviewsController < ApplicationController
  def create
    return redirect_to users_show_path(params[:user_id]) unless current_user.reviews_made.where(user_id: params[:user_id]).empty?

    current_user.reviews_made.create(review_params)
    redirect_to users_show_path(params[:user_id])
  end

  def new; end

  def destroy
    review = Review.find(params[:id])
    return unless review.reviewer == current_user

    review.destroy
  end

  private

  def review_params
    params.permit(:user_id, :content, :rating)
  end
end
