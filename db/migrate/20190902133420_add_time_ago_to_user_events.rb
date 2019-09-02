class AddTimeAgoToUserEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :user_events, :time_ago, :string
  end
end
