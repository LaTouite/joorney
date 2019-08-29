class SuggestionsController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @survey = Survey.where(event_id: @event.id)
    @suggestions = Suggestion.where(survey_id: @survey.id)

    authorize @event
    authorize @survey
    authorize @suggestions
  end
end
