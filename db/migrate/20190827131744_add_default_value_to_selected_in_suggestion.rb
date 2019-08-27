class AddDefaultValueToSelectedInSuggestion < ActiveRecord::Migration[5.2]
  def change
    change_column :suggestions, :selected, :boolean, default: false
  end
end
