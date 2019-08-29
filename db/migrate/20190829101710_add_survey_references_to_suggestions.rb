class AddSurveyReferencesToSuggestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :suggestions, :survey, foreign_key: true
  end
end
