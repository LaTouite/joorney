class EventsController < ApplicationController

  def new
    # raise
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(params_event)
    @event.user = current_user
    # if @event.start_date <= Date.today && @event.end_date <= Date.today
    #   @event.start_date = nil
    #   @event.end_date = nil
    # end
    if @event.destination == ''
      @event.destination = nil
    end
    if @event.save
      @survey = Survey.new(name: @event.name)
      @survey.event = @event
      @survey.save
      if @survey.save
        redirect_to survey_path(@survey)
      else
        render :new
      end
    else
      render :new
    end
    authorize @event
  end

  def edit
    @event = Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    @event.update(params_event)
    authorize @event
  end

  def show
    @event = Event.find(params[:id])
    @survey = Survey.find_by(event_id: @event.id)
    authorize @event
  end

  def invite
    @user_event = UserEvent.new
    @event = Event.find(params[:id])
    authorize :event, :invite?
  end

  def accomodation
    @event = Event.find(params[:id])
    @event.update(params_event_accomodation)
    @participants = UserEvent.where(event_id: @event.id)
    # @url = "https://www.airbnb.fr/s/#{@event.destination}/homes?checkin=#{@event.start_date.strftime('%F')}&checkout=#{@event.end_date.strftime('%F')}&price_max=150&adults=#{@participants.size}"
    @markers = [ {lat: @event.latitude,
    lng: @event.longitude} ]
    authorize @event
  end

  private

  def params_event
    params.require(:event).permit(:name, :event_category, :thematics, :start_date, :end_date, :destination, :budget_per_participant, :photo, :photo_cache, :deadline, :token, :accomodation_address, :accomodation_address)
  end

  def params_event_accomodation
    params.permit(:accomodation_address)
  end
end
