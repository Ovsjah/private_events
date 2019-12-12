module SessionsHelper
  def signin(user)
    session[:user_id] = user.id
  end

  def signout
    session.delete(:user_id)
  end
    
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !!current_user
  end
end
