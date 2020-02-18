class EventsController < ApplicationController
  before_action :authenticate
  before_action :get_user, :authorize, except: %i[index show]
  before_action :get_event, only: %i[show update]

  def index
    @upcoming = Event.not_hosted_by(current_user).upcoming
    @past = Event.not_hosted_by(current_user).past
  end

  def new
    @event = current_user.hosted_events.build
  end

  def create
    @event = current_user.hosted_events.build(event_params)

    if @event.save
      redirect_to current_user, flash: { success: 'Event is created successfully.' }
    else
      render :new
    end
  end

  def edit
    @event = current_user.hosted_events.find(params[:id])
  end

  def update
    if @event.update(event_params)
      redirect_to current_user, flash: { success: "Your event has been successfully updated!" }
    else
      render "edit"
    end
  end

  def destroy
    event = current_user.hosted_events.delete(params[:id]) if Event.exists?(params[:id])
    redirect_to current_user, flash: {
      success: "Event at #{event&.first&.date&.strftime('%_d %b %Y %H:%M')} has successfully been deleted."
    }
  end

  private

    def event_params
      params.require(:event).permit(:date, :description)
    end

    def get_user
      @user = User.find_by_id(params[:user_id])
    end

    def get_event
      @event = Event.find(params[:id])
    end
end
