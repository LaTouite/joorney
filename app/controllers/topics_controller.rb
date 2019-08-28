class TopicsController < ApplicationController
  def create
    @survey = Survey.find(params[:survey_id])
    @topic = Topic.new(topic_params)
    @topic.survey = @survey
    if @topic.save
      redirect_to survey_path(@survey)
    else
      render 'surveys/show'
    end
    authorize @topic
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end
end
