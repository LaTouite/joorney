class AddNbofParticipantsInEventActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :event_activities, :nb_of_participants, :integer
  end
end
