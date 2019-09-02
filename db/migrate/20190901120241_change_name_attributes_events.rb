class ChangeNameAttributesEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :accomodation_latitude, :latitude
    rename_column :events, :accomodation_longitude, :longitude
  end
end
