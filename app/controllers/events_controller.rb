class EventsController < ApplicationController

  def new
    @event = Event.new
    authorize @event
  end

  def create
    raise
    @event = Event.new(params_event)
    @event.user = current_user
    if @event.save
      redirect_to new_event_survey_path(@event)
    else
      render :new
    end
    authorize @event
  end

  def show
    @event = Event.find(params[:id])
    authorize @event
  end

  def invite
    @event = Event.find(params[:id])
    authorize :event, :invite?
  end

  private

  def params_event
    params.require(:event).permit(:name, :event_category, :thematics, :start_date, :end_date, :destination, :budget_per_participant, :photo, :photo_cache, :deadline, :token)
  end
end
