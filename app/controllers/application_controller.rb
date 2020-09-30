require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    # if self.current_user && self.is_logged_in?
    @user = User.find_by(username: params[:username])
    if @user !=nil && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect '/account'
    end
    redirect '/error'
  end

  get '/account' do
    @user = User.find_by(session[:user_id])
    if @current_user
      erb :account
    else
      erb :error
    end
  end
    erb :account
  end


  get '/logout' do
    session.clear
    redirect '/'
  end


end
