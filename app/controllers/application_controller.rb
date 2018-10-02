class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #Route: /recipes - Index Action
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #Route: /recipes/new - New Action
  get '/recipes/new' do
    erb :new
  end

  #Route: /recipes - Create Action
  post '/recipes' do
    recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])

    redirect :"/recipes/#{recipe.id}"
  end

  #Route: /recipes/:id - Show Action
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])

    erb :show
  end

  #Route: /recipes/:id/edit - Edit Action
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])

    erb :edit
  end

  #Route: /recipes/:id - Update Action
  patch '/recipes/:id' do
    recipe = Recipe.find_by_id(params[:id])
    recipe.name = params[:name]
    recipe.ingredients = params[:ingredients]
    recipe.cook_time = params[:cook_time]
    recipe.save

    redirect :"/recipes/#{recipe.id}"
  end

  #Route: /recipes/:id/delete - Delete Action
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy

    erb :delete
  end

end
