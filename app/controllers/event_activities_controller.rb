class EventActivitiesController < ApplicationController


  def create
    @event_activity = EventActivity.new(favorite: true)


    authorize @event_activity
  end

  def destroy

  end

end
