class EventActivitiesController < ApplicationController


  def create
    @event_activity = EventActivity.new(favorite: true)
    @event_activity.event = Event.where(id: params[:event_id])
    @event_activity.activity = Activity.where(id: params[:activity_id])
    @event_activity.save

    authorize @event_activity
  end

  def destroy

  end

end
