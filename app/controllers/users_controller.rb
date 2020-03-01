class UsersController < ApplicationController
  before_action :authenticate, :get_user, :authorize, only: %i[show_hosted_events show_attended_events attend do_not_attend]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      signin
      redirect_to @user, flash: { success: 'Successfully signed up' }
    else
      render :new
    end
  end

  def show_hosted_events
    @upcoming_hosted_events = current_user.hosted_events.upcoming
    @past_hosted_events = current_user.hosted_events.past
  end

  def show_attended_events
    @upcoming_attended_events = current_user.attended_events.upcoming
    @past_attended_events = current_user.attended_events.past
  end

  def attend
    current_user.attend(params[:event_id])
    redirect_to events_path, flash: { success: 'The event is added to attended upcoming events.' }
  end

  def do_not_attend
    current_user.do_not_attend(params[:event_id])
    redirect_to events_path, flash: { success: 'The event is removed from attended upcoming events.' }
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def get_user
      @user = User.find_by_id(params[:id])
    end
end
