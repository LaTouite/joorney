class SuggestionsController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @survey = Survey.find_by(event_id: @event.id)
    @suggestions = policy_scope(Suggestion).where(survey_id: @survey.id)
    @suggestions_dates = @suggestions.where(topic: "Dates")
    @suggestions_destination = @suggestions.where(topic: "Destination")
    @choice = Choice.new
  end
end
