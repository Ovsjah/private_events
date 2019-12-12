class EventsController < ApplicationController
  before_action :authenticate

  def index
    @events = Event.all
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(events_params)

    if @event.save
      flash[:success] = 'Event is created successfully'
      redirect_to user_event_path(current_user, @event)
    else
      render :new
    end
  end

  def show
    @event = Event.includes(:creator).find(params[:id])
  end

  private

    def events_params
      params.require(:event).permit(:description)
    end
end
