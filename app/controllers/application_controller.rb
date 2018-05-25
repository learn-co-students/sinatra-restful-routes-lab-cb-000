class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get "/recipes" do
    @recipe = Recipe.all 
    erb :index
  end
  
   get "/recipes/new" do
    erb :new
  end
  
  get "/recipes/:id" do
    @recipe = Recipe.find_by(id: params[:id])
    erb :show
  end
  
  get "/recipes/:id/edit" do
    @recipes = Recipe.find_by(id: params[:id])
    erb :edit
  end
  
  patch "/recipes/:id" do
    @recipes = Recipe.find_by(id: params[:id])
    @recipes.name = params[:name]
    @recipes.ingredients = params[:ingredients]
    @recipes.cooking_time = params[:cooking_time]
    @recipes.save
    
    redirect to("/recipes/#{params[:id]}")
  end
  
  
  delete "/recipes/:id/delete" do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    redirect "/recipes"
  end 
  
  post "/recipes" do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{@recipe.id}"
  end
  
end