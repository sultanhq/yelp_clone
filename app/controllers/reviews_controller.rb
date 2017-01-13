class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new
  end

  def create
    user = current_user
    @restaurant = Restaurant.find params[:restaurant_id]
    @review = @restaurant.build_review review_params, current_user
    if @review.save
      redirect_to restaurant_path(@review.restaurant_id)
    else
      if @review.errors[:user]
        redirect_to restaurants_path, alert: @review.errors.full_messages[0]
      else
        render 'new'
      end
    end
  end

  def destroy
    @review = Review.find (params[:id])
    @review.destroy
    flash[:notice] = 'Review deleted successfully'
    redirect_to restaurant_path(@review.restaurant_id)
  end

  private

  def review_params
    params.require(:review).permit(:thoughts, :rating )
  end

end
