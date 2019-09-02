class AddCoordinatesToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :accomodation_latitude, :float
    add_column :events, :accomodation_longitude, :float
  end
end
