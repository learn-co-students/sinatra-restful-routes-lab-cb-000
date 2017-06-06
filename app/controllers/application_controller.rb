require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/recipes'
  end


  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    if @recipe = Recipe.find_by(id: params[:id])
      erb :show
    end
  end

  post '/recipes' do
    recipe = Recipe.new(
    name: params[:name],
    ingredients: params[:ingredients],
    cook_time: params[:cook_time])

    if recipe.save
      redirect "/recipes/#{recipe.id}"
    else
      redirect '/recipes/new'
    end

  end

  get '/recipes/:id/edit' do
    if @recipe = Recipe.find_by(id: params[:id])
      erb :edit
    end
  end

  patch '/recipes/:id/edit' do
      recipe = Recipe.find_by(id: params[:id])
      recipe.update(:name => params[:name], :ingredients =>  params[:ingredients], :cook_time => params[:cook_time])
      redirect "/recipes/#{params[:id]}"
    end

  delete '/recipes/:id/delete' do
    if Recipe.find_by(id: params[:id])
      Recipe.delete(params[:id])
    end
    redirect '/recipes'
  end

end
