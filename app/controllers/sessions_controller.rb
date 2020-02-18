class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:session][:email].downcase)
    if @user&.authenticate(params[:session][:password])
      signin
      redirect_to @user, flash: { success: "Successfully signed in" }
    else
      flash.now[:danger] = "Invalid email/password"
      render :new
    end
  end

  def destroy
    signout
    redirect_to signin_path, flash: { success: "Goodbye" }
  end
end
