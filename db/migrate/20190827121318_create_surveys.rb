class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.string :name
      t.datetime :deadline
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
