class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :event_category
      t.string :thematics, array: true
      t.datetime :start_date
      t.datetime :end_date
      t.string :destination
      t.monetize :budget_per_participant
      t.string :photo
      t.datetime :deadline
      t.string :token
      t.references  :user, foreign_key: true

      t.timestamps
    end
  end
end
