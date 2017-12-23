class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/recipes'
  end

  #Create a new recipe
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    if @recipe.save
      redirect "/recipes/#{@recipe.id}"
    else
      redirect '/recipes/new'
    end
  end

  #Display a single recipe
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  #Edit a single recipe
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{params[:id]}"
  end

  #Display all recipes (index)
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #Delete a recipe
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect '/recipes'
  end

end
