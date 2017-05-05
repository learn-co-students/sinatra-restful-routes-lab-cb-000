class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    @recipes=Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe=Recipe.find_by(id: params[:id].to_i)
    erb :recipe
  end

  delete '/recipes/:id/delete' do
    Recipe.find_by(id: params[:id].to_i).delete
    redirect '/recipes'
  end

  get '/recipes/:id/edit' do
    @recipe=Recipe.find_by(id: params[:id].to_i)
    erb :edit
  end

  patch '/recipes/:id' do
    recipe=Recipe.find_by(id: params[:id].to_i)
    recipe.name = params[:name]
    recipe.cook_time = params[:cook_time]
    recipe.ingredients = params[:ingredients]
    recipe.save
    redirect '/recipes/'+params[:id]
#    redirect '/recipes'
  end

  post '/recipes/:id' do
    recipe=Recipe.find_by(id: params[:id].to_i)
    recipe.name = params[:name]
    recipe.cook_time = params[:cook_time]
    recipe.ingredients = params[:ingredients]
    recipe.save
    redirect '/recipes/'+params[:id]
#    redirect '/recipes'
  end

  post '/recipes' do
    Recipe.create(params)
    redirect '/recipes'
  end


  get '/recipes' do
    @recipes=Recipe.all
    erb :index
  end

end
