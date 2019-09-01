class CreateEventActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :event_activities do |t|
      t.references :activity, foreign_key: true
      t.references :event, foreign_key: true
      t.boolean :favorite, default: false
      t.boolean :selected, default: false
      t.timestamps
    end
  end
end
