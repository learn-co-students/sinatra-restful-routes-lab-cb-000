class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # GET /recipes - Route: Index Action
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # GET /recipes/new - Route: New Action
  get '/recipes/new' do
    erb :new
  end

  # POST /recipes - Route: Create Action
  post '/recipes' do
    recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])

    redirect :"/recipes/#{recipe.id}"
  end

  # GET /recipes/:id - Route: Show Action
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])

    erb :show
  end

  # /recipes/:id/edit - Route: Edit Action
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])

    erb :edit
  end

  # PATCH /recipes/:id - Route: Edit Action
  patch '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    recipe.name = params[:name]
    recipe.ingredients = params[:ingredients]
    recipe.cook_time = params[:cook_time]
    recipe.save

    redirect :"/recipes/#{recipe.id}"
  end

  # DELETE /recipes/:id/delete - Route: Delete Action
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    erb :delete
  end

end
