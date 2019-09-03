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
    # if @event.destination == ''
    #   @event.destination = nil
    # end
    if @event.save
      @survey = Survey.new(name: @event.name)
      @survey.event = @event
      # @survey.save
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
    authorize @event
    if @event.update(params_event)
      redirect_to event_activities_path(@event)
    end
    # if @event.update(params_event)
    #   respond_to do |format|
    #     format.html { redirect_to event_activities_path(@event) }
    #     format.js
    #   end
    # end
  end

  def show
    @event = Event.find(params[:id])
    @survey = Survey.find_by(event_id: @event.id)
    #@user_event = UserEvent.where(user_id: @user.id)
    authorize @event

    # Recuperation des datas de budget pour chart
    if @event.budget_per_participant_cents != 0
      @budget_tot = @event.budget_per_participant_cents * @event.user_events.size

      @budget_activities = 0
      @event.event_activities.each do |selected_activity|
        budget_per_activity = selected_activity.nb_of_participants * selected_activity.activity.unit_price
        @budget_activities += budget_per_activity
      end

      @budget_remaining = @budget_tot - @budget_activities
    end
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
    params.require(:event).permit(:name, :event_category, :thematics, :start_date, :end_date, :destination, :budget_per_participant_cents, :photo, :photo_cache, :deadline, :token, :accomodation_address)
  end

  def params_event_accomodation
    params.permit(:accomodation_address)
  end
end
