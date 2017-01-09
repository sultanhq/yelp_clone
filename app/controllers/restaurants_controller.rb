class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new

  end

  def create
    Restaurant.create(restarant_params)
    redirect_to '/restaurants'
  end

  private

  def restarant_params
    params.require(:restaurant).permit(:name)
  end
end
