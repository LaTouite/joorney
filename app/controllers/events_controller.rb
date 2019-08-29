class EventsController < ApplicationController

  def new
    # raise
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(params_event)
    @event.user = current_user
    if @event.save
      @survey = Survey.new(name: @event.name)
      @survey.event = @event
      @survey.save

      if @survey.save
        # if @event.destination == nil
        #   @topic = Topic.new(name: "Destination")
        #   @topic.survey = @survey
        #   @topic.save
        # end
        # if @event.start_date == nil
        #   @topic = Topic.new(name: "Dates")
        #   @topic.survey = @survey
        #   @topic.save
        # end
        # if @event.end_date == nil
        #   topic = Topic.new(name: "Date de fin")
        #   @topic.survey = @survey
        #   @topic.save
        # end
        # if @event.budget_per_participant_cents == 0
        #   @topic = Topic.new(name: "Budget / participant")
        #   @topic.survey = @survey
        #   @topic.save
        # end
        redirect_to survey_path(@survey)
        else
          render :new
      end
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
    @user_event = UserEvent.new
    @event = Event.find(params[:id])
    authorize :event, :invite?
  end

  def accomodation
    @event = Event.find(params[:id])
    @participants = UserEvent.where(event_id: @event.id)
    # @url = "https://www.airbnb.fr/s/#{@event.destination}/homes?checkin=#{@event.start_date.strftime('%F')}&checkout=#{@event.end_date.strftime('%F')}&price_max=150&adults=#{@participants.size}"
    authorize @event
  end



  private

  def params_event
    params.require(:event).permit(:name, :event_category, :thematics, :start_date, :end_date, :destination, :budget_per_participant, :photo, :photo_cache, :deadline, :token)
  end
end
