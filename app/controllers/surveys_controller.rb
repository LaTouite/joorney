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
    @suggestion = Suggestion.new
    @thematics = @survey.suggestions.where(topic: "Thématiques")
    authorize @survey
  end

  def edit
    @survey = Survey.find(params[:id])
    authorize @survey
  end

  def update
    @survey = Survey.find(params[:id])
    @survey.update(survey_params)
    authorize @survey
    if @survey.deadline != nil
      respond_to do |format|
        format.html { redirect_to survey_path(@survey) }
        format.js  # <-- will render `app/views/surveys/update.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'surveys/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:name, :deadline)
  end
end
