require 'sinatra/base'
class Helpers

  def self.current_user(session)
    @user = User.find(session[:user_id])
  end

  def is_logged_in?
  end
end
