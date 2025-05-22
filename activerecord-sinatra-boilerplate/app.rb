require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

get "/" do
  # do stuff
  "Le wagon"
end

get "/home" do
  # do stuff
  "Homepage"
end
