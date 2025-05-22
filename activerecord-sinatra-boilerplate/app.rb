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

get "/home" do
  # do stuff
  "Homepage"
end
