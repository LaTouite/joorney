class SurveysController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @survey = Survey.new
    authorize @survey
  end

  def create
    @survey = Survey.new(survey_params)
    @event = Event.find(params[:event_id])
    @survey.event = @event
    @survey.save
    authorize @survey
    redirect_to invite_event_path(@event)
  end

  def show
    @survey = Survey.find(params[:id])
    authorize @survey
    @topic = Topic.new
  end

  private

  def survey_params
    params.require(:survey).permit(:name, :deadline)
  end
end
