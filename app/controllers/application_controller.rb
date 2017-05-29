class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
  end
  
  #show all recipes
  get '/recipes' do
    @recipes = Recipe.all
    @msg = session[:msg]
    erb :index
  end

  #create new recipe
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], 
              ingredients: params[:ingredients], 
              cook_time: params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end

  #show specific recipe
  get '/recipes/:id' do
    @recipe = Recipe.find(params["id"])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params["id"])
    erb :edit
  end

  #edit specific recipe 
  patch '/recipes/:id' do
    recipe = Recipe.find(params["id"])
    recipe.name = params[:name]
    recipe.ingredients = params[:ingredients]
    recipe.cook_time = params[:cook_time]
    recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  #delete specific recipe
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params["id"])
    session[:msg] = "#{@recipe.name} was deleted!"
    @recipe.delete
    redirect to '/recipes'
  end
 
end