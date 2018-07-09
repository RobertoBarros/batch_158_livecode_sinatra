require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

get "/restaurants" do
  @restaurants = Restaurant.all
  erb :index
end

get '/restaurants/new' do
  erb :new
end

post '/restaurants/create' do
  restaurant = Restaurant.new
  restaurant.name = params['name']
  restaurant.address = params['address']
  restaurant.rating = params['rating']
  restaurant.save

  redirect("/restaurants/#{restaurant.id}")

end

get '/restaurants/:id/edit' do
  @restaurant = Restaurant.find(params[:id])
  erb :edit
end

post '/restaurants/:id/update' do
  restaurant = Restaurant.find(params[:id])
  restaurant.name = params['name']
  restaurant.address = params['address']
  restaurant.rating = params['rating']
  restaurant.save

  redirect("/restaurants/#{restaurant.id}")
end

get '/restaurants/:id/destroy' do
  restaurant = Restaurant.find(params[:id])
  restaurant.destroy
  redirect("/restaurants")
end


get "/restaurants/:id" do
  id = params[:id]
  @restaurant = Restaurant.find(id)

  erb :show
end
