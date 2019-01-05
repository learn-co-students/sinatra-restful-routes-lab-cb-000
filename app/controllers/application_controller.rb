require './config/environment'
require './app/models/recipe'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  # Show page
  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all

    erb :"recipe/index"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])

    erb :"recipe/recipe"
  end

  # Delete Recipe
  delete '/recipes/:id' do
    Recipe.find(params[:id]).delete

    redirect '/recipes'
  end

  # Edit Page
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])

    erb :"recipe/edit"
  end

  patch '/recipes/:id' do
    data = ["name", "ingredients", "cook_time"]
    @recipe = Recipe.find(params[:id])

    data.each do |data|
      if params[data.to_sym].empty?
        erb :"recipe/error"
      end
    end

    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save

    redirect "/recipes/#{@recipe.id}"
  end
end
