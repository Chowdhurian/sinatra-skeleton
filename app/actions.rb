# Homepage (Root path)
get '/login' do
    erb :login
end

get '/profile' do
    @users = User.all
    erb :profile
end

get '/' do
    @visitor_name = params[:name]
    erb :index
end

get '/videos' do
    @videos = Video.all
    erb :videos
end

get '/users' do
    @users = User.all
    erb :users
end

