class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    # Get all the restaurants
    @restaurants = Restaurant.all
  end

  def show
    # Find the restaurant user is looking for
  end

  def new
    # Initialize an empty restaurant instance
    @restaurant = Restaurant.new
  end

  def create
    # Get necessary attributes from parameter
    restaurant_params = params.require(:restaurant).permit(:name, :address, :rating)
    @restaurant = Restaurant.new(restaurant_params)
    # Create a new instance of restaurant
    @restaurant.save
    # Redirect them to the show page of the restaurant that was just created
    redirect_to restaurant_path(@restaurant)
  end

  def edit
    # Find the restaurant using id
  end

  def update
    # Find the restaurant
    # Permit the new params
    restaurant_params = params.require(:restaurant).permit(:name, :address, :rating)
    # Update with the params
    @restaurant.update(restaurant_params)
    # Redirect them to the show page
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    # Find the restaurant
    # Destroy from the DB
    @restaurant.destroy
    # Redirect to index
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
