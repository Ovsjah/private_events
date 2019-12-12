class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      signin(user)
      flash[:success] = "Successfully signed in"
      redirect_to user
    else
      flash.now[:danger] = "Invalid email/password"
      render :new
    end
  end

  def destroy
    signout
    flash[:success] = "Goodbye"
    redirect_to signin_path
  end
end
