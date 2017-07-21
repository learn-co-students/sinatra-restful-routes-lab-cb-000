class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end
#
#
#
  get '/recipes' do #Should show all recipes
    @recipes = Recipe.all
    erb :index
  end

  # Show form to reate a new recipe
  get '/recipes/new' do
    erb :new
  end

  # Shows an individual recipe
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id( params[:id])
    erb :show
  end


  post '/recipes' do
    @recipe = Recipe.create( params )
    redirect "/recipes/#{@recipe.id}"
  end

  # Edit an existing recipe
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id( params[:id])

    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id( params[:id])
    #puts "Recipe Before:#{@recipe}"
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    #puts "Recipe After:#{@recipe}"
    redirect "/recipes/#{@recipe.id}"
  end

  # Delete an existing recipe
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id( params[:id] )
    @recipe.delete
    #erb :index
    redirect '/recipes'
  end


end
