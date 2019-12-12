class ApplicationController < ActionController::Base
  def signin(user)
    session[:user_id] = user.id
  end

  def signout
    session.delete(:user_id)
  end
end
