require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

get "/" do
  # GOAL: List all the restaurants (name)
  # Get all the restaurant instances (Model)
  @restaurants = Restaurant.all
  # Display all the restaurant names (View)
  erb :index
end

get "/restaurants/:id" do
  # do stuff
  # Get the restaurant instance with ID in the param
  @restaurant = Restaurant.find(params[:id])
  # Display the details with view
  erb :show
end
