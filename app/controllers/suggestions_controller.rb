class SuggestionsController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @survey = Survey.where(event_id: @event.id)
    @suggestions = Suggestion.where(survey_id: @survey.id)

    authorize @event
    authorize @survey
    authorize @suggestions
  end

  def create
    @suggestion = Suggestion.create(suggestion_params)
    @suggestion.survey = Survey.find(params[:survey_id])
    authorize @suggestion
    @suggestion.save!
  end

  def suggestion_params
    params.require(:suggestion).permit(:start_date, :end_date, :value, :topic)
  end
end
