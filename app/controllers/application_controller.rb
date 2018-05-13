class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect "/recipes"
  end

  get '/recipes' do
    # displays all recipes
    @recipes = Recipe.all
    erb :index
  end

  post '/recipes' do
    # creates a new recipe
    recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/${recipe.id}"
  end

  get '/recipes/new' do
    # renders form for new recipes
    erb :new
  end

  get '/recipes/:id' do
    # displays a specific recipe
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  #TODO post recipes/:id

  get '/recipes/:id/edit' do
    # renders form to edit an existing recipe
    @recipe = Recipe.find(params[:id])
    erb :edit
  end



end
