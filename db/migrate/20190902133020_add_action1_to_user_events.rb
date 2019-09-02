class AddAction1ToUserEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :user_events, :action1, :boolean, default: false
  end
end
