class ChangeTypeDateInSuggestion < ActiveRecord::Migration[5.2]
  def change
    change_column :suggestions, :start_date, :date
    change_column :suggestions, :end_date, :date
  end
end
