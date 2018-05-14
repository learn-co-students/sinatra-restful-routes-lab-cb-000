class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect "/recipes"
  end

  get '/recipes' do # displays all recipes
    @recipes = Recipe.all
    erb :index
  end

  post '/recipes' do # creates a new recipe
    recipe = Recipe.create({name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time]})
    redirect to "/recipes/#{recipe.id}"
  end

  get '/recipes/new' do # renders form for new recipes
    erb :new
  end

  get '/recipes/:id' do # displays a specific recipe
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do # renders form to edit and delete an existing recipe
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do # edits/patches a specific recipe
    Recipe.find(params[:id]).update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "/recipes/#{recipe.id}"
  end

  delete '/recipes/:id/delete' do # deletes a specific recipe
    Recipe.destroy(params[:id])
    redirect to "/recipes"
  end
end
