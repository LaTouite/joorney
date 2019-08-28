class EventsController < ApplicationController

  def new
    @event = Event.new
    authorize @event
    @survey = Survey.new
  end

  def create
    @event = Event.new(params_event)
    @event.save
    # redirect_to event_path(@event)
    authorize @event
  end

  def show
    @event = Event.find(params[:id])
    authorize @event
  end

  private

  def params_event
    params.require(:event).permit(:name, :event_category, :thematics, :start_date, :end_date, :destination, :budget_per_participant, :photo, :deadline, :token)
  end
end
