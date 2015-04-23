# Homepage (Root path)

require 'sinatra/base'
require 'rack-flash'
require 'pry'

enable :sessions
use Rack::Flash

helpers do
   def current_user 
       @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
   end
end

get '/' do
    erb :index
end

get '/login' do
    erb :login
end

post '/login' do
    username = params[:username]
    password = params[:password]
    
    user = User.find_by(username: username)
    if (user && user.password == password)
        session[:user_id] = user.id
        redirect '/'
    else
        flash.now[:notice] = "Username/password not correct :("
        redirect '/login'
    end
end

get '/logout' do
    erb :logout
    redirect '/'
end

get '/profile/edit' do
    current_user
    erb :profile
end

post '/profile/edit' do
    username = params[:username]
    email = params[:email]
    password = params[:password]
    
    current_user.update username: username, email: email, password: password
    
    redirect '/'
end

get '/signup' do
    erb :signup
end

post '/signup' do
    username = params[:username]
    email = params[:email]
    password = params[:password]
    
    user = User.find_by(username: username)
    if user #not sure if this works
        flash.now[:notice] = "That username already exists."
        erb :signup
    else #the part after the else works
        user = User.create(username: username, email: email, password: password)
        session[:user_id] = user.id
        flash[:notice] = "Thanks for signing up!" 
        redirect '/'
    end
end

# post '/user/create' do
#    username = params [:username]
#    password = params[:password]
#
#    User.create username: username, password: password
#    redirect '/'
#end

get '/videos/new' do
    erb :new_video
end

# create a new video

post '/videos/new' do
    title = params[:title]
    image = params[:image]
    media_type = params[:media_type]
    genre = params[:genre]
    
#    video = Video.find_by(title: title)
#    if video
#        flash.now[:notice] = "You've already entered that one!"
#        erb :video
#    else
    new_video = current_user.videos.create(title: title, image: image, media_type: media_type, genre: genre)
    redirect "/videos/#{new_video.id}"
#    end 
end

#for my videos
get '/videos/my' do
    @videos = current_user.videos
    erb :'/video/my'
end

# show a particular video
get '/videos/:id' do
    @video = Video.find(params[:id])
    erb :video
end

#show all videos
get '/videos' do
    @videos = Video.all
    erb :'/video/index' #correct?
end