class SuggestionsController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @survey = Survey.find_by(event_id: @event.id)
    @suggestions = policy_scope(Suggestion).where(survey_id: @survey.id)
    @suggestions_dates = @suggestions.where(topic: "Dates")
    @suggestions_destination = @suggestions.where(topic: "Destination")
    @choice = Choice.new
  end

  def create
    @suggestion = Suggestion.create(suggestion_params)
    @suggestion.survey = Survey.find(params[:survey_id])
    authorize @suggestion
    @suggestion.save!
    if @suggestion.save
      respond_to do |format|
        format.html { redirect_to survey_path(@survey) }
        format.js  # <-- will render `app/views/suggestion/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'surveys/show' }
        format.js  # <-- idem
      end
    end
  end

  def suggestion_params
    params.require(:suggestion).permit(:start_date, :end_date, :value, :topic)
  end
end
