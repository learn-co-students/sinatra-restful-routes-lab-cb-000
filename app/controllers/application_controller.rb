class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  # get '/' do
  #   erb :index
  # end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # dont see whats wrong here, bruh
  get '/recipes/new' do
    erb :new
  end

  post '/posts' do
   x = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
   # create should save it, too, right
   # nada...
   # p 'hi there'
   # p Post.all
  #  @posts = Post.all
   # p @posts.size
  #  erb :index

  # use x to make redir link

  redirect
 end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    #
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])

    erb :edit
  end


end
