class TopicsController < ApplicationController
  def create
    # 1. On va chercher le survey sur lequel on veut creer un topic
    @survey = Survey.find(params[:survey_id])
    # 2. On creer un nouveau topic
    @topic = Topic.new(topic_params)
    # 3. On rattache le nouveau topic au survey que l'on a cherche dans l'etape 1
    @topic.survey = @survey

    if @topic.save
      redirect_to survey_path(@survey)
    else
      render 'surveys/show'
    end
    # Pundit
    authorize @topic
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end
end
