class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    erb :index
  end
  
  get '/recipes' do
    erb :recipes
    
  end
  
  patch '/recipes/:id' do
    erb :recipes_id
    
  end
  
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy
    
    redirect '/recipes'
  end
end