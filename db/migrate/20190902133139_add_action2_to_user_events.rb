class AddAction2ToUserEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :user_events, :action2, :boolean, default: false
  end
end
