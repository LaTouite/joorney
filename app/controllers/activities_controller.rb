class ActivitiesController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @activities = policy_scope(Activity)

    if @event.accomodation_address?
      @activities = Activity.near([@event.latitude, @event.longitude], 30, :order => :distance)
    # Dans le cas de la destination, on n'a que la ville sans latitude ni longitude
    # elsif @event.destination?
    #   @activities = Activity.near([@event.destination.latitude, @event.destination.longitude], 30, :order => :distance)
    end

    @event_activities = @event.event_activities
    @favorited_activities = @event.activities

    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        image_url: helpers.asset_url('picto-joorney.png')
      }
    end
    @markers << {lat: @event.latitude, lng: @event.longitude, image_url: helpers.asset_url('home-solid.svg')}

  end

  def show
    @activity = Activity.find(params[:id])
    @event_activity = EventActivity.new
    @event = Event.find(params[:event_id])
    authorize @activity

    @markers = [ {lat: @activity.latitude,
        lng: @activity.longitude} ]
  end
end
