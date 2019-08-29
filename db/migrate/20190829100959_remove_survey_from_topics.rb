class RemoveSurveyFromTopics < ActiveRecord::Migration[5.2]
  def change
    remove_reference :topics, :survey, foreign_key: true
  end
end
