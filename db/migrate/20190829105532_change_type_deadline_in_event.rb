class ChangeTypeDeadlineInEvent < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :deadline, :date
  end
end
