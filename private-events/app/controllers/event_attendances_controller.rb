class EventAttendancesController < ApplicationController
  before_action :authenticate_user!
  def create
    @event = Event.find(params[:event_id])
    if @event.attendees.include?(current_user)
      flash[:alert] = "You are already attending this event!"
    else
      @event.attendees << current_user
      flash[:notice] = "You're on the list!"
    end
    redirect_to @event
  end
end
