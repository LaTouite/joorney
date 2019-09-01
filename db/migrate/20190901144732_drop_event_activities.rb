class DropEventActivities < ActiveRecord::Migration[5.2]
  def change
    drop_table :event_activities
  end
end
