require './config/environment'
require './app/models/recipe'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all

    erb :index
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])

    erb :recipe
  end

  delete '/recipes/:id' do
    Recipe.find(params[:id]).delete

    redirect '/recipies'
  end
end
