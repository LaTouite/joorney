class AddAccomodationsDetailsToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :accomodation_presence, :boolean, default: false
    add_column :events, :accomodation_address, :string
    add_monetize :events, :accomodation_price, currency: { present: false }
  end
end
