class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end

  get '/recipes' do
    #displays list of recipies
    @recipes = Recipe.all
    erb :'recipe/index'
  end

  post '/recipes' do
    #create new recipe in db
    @recipe = Recipe.new(name: params[:name])
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/new' do
    erb :'recipe/new'
  end

  delete '/recipes/:id/delete' do
    recipe = Recipe.find_by_id(params[:id])
    recipe.destroy
    redirect '/recipes'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :'recipe/edit'
  end

  patch '/recipes/:id/edit' do
    recipe = Recipe.find_by_id(params[:id])
    recipe.name = params[:name]
    recipe.ingredients = params[:ingredients]
    recipe.cook_time = params[:cook_time]
    recipe.save

    redirect "/recipes/#{recipe.id}"
  end

  get '/recipes/:id' do
    if @recipe = Recipe.find_by_id(params[:id])
      erb :'recipe/show'
    else
      redirect '/recipes'
    end
  end
end
