class CreateSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :suggestions do |t|
      t.string :value
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :selected
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
