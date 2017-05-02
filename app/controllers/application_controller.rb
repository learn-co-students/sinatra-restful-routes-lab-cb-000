class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # create

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])

    if recipe.save
      redirect "/recipes/#{recipe.id}"
    else
      'Somthing went wrong'
    end
  end

  # read
  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all

    erb :index
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :show
  end



  # update

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(id: params[:id])

    erb :edit
  end

  patch '/recipes/:id' do
    recipe = Recipe.find_by(id: params[:id])
    recipe.name = params[:name]
    recipe.ingredients = params[:ingredients]
    recipe.cook_time = params[:cook_time]
    recipe.save

    redirect "/recipes/#{recipe.id}"
  end

  delete '/recipes/:id/delete' do
    Recipe.find_by(id: params[:id]).destroy

    redirect '/recipes'
  end


end
