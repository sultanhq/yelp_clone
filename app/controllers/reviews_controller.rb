class ReviewsController < ApplicationController

  before_action :authenticate_user!

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    user = current_user
    @restaurant = user.restaurants.find(params[:restaurant_id])
    require'pry';binding.pry
    @restaurant.buildReview(review_params,user)
    # @restaurant.reviews.create(review_params)
    redirect_to "/restaurants/#{@restaurant.id}"
  end

  private

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end
end
