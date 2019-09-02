class EventActivitiesController < ApplicationController
  def create
    @event_activity = EventActivity.new(favorite: true)
    @event_activity.event = Event.find(params[:event_id])
    @event_activity.activity = Activity.find(params[:activity_id])
    @event_activity.save
    authorize @event_activity
    redirect_to event_activities_path(@event_activity.event)
  end

  def destroy
    @event_activity = EventActivity.find(params[:id])
    @event_activity.destroy
    authorize @event_activity
  end

end
