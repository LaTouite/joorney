class ChoicesController < ApplicationController

  def create

    @choice = Choice.new(params_choice)
    @choice.user = current_user
    results = params[:choice][:suggestion_id]
    if results.length == 1
      @choice.suggestion = Suggestion.find(results)
      @choice.save!
    else
      cleaned_results = results.drop(1)
      cleaned_results.each do |result|
        @choice.suggestion = Suggestion.find(result)
        @choice.save!
      end
    end

    redirect_to event_suggestions_path(@choice.suggestion.survey.event)
    authorize @choice
  end

  private

  def params_choice
    params.require(:choice).permit(:suggestion)
  end
end
