class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.integer :unit_price
      t.string :category
      t.string :schedule
      t.integer :min_number_of_participants
      t.integer :max_number_of_participants
      t.integer :min_age
      t.integer :duration
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :main_photo
      t.string :second_photo
      t.timestamps
    end
  end
end
