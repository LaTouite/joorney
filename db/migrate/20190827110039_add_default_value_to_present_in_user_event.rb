class AddDefaultValueToPresentInUserEvent < ActiveRecord::Migration[5.2]
  def change
    change_column :user_events, :present, :boolean, default: false
  end
end
