class AddPhoneNumberToUserEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :user_events, :phone_number, :string
  end
end
