class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
  #  raise params.inspect
  #"route is working"
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  post '/recipes/new' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    #raise @recipe.inspect
    erb :edit
  end

  patch '/recipe/:id' do
    @recipe = Recipe.find(params[:id])
    #raise params.inspect
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe = Recipe.find(params[:id])
    #raise @recipe.inspect
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes' do
    @recipe = Recipe.all
  #  raise @recipe.first.ingredients.inspect

    erb :index
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect '/index'
  end

end
