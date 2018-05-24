class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end
  get '/recipes' do
    @recipes = Recipe.all
    erb :"/recipe/index"
  end
  post '/recipes' do
    Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to ("/recipes/#{Recipe.last.id}")
  end
  get "/recipes/new" do
    erb :"/recipe/new"
  end
  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :"/recipe/show"
  end
  delete "/recipes/:id/delete" do
    Recipe.delete(params[:id])
    redirect to("/recipes")
  end
  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :"/recipe/edit"
  end
  patch '/recipes/:id' do
    Recipe.find(params[:id]).update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to("/recipes/#{params[:id]}")
  end
end
