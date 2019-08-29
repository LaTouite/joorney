class ChangeTypeDeadlineInSurvey < ActiveRecord::Migration[5.2]
  def change
    change_column :surveys, :deadline, :date
  end
end
