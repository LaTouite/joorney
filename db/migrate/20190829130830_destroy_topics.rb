class DestroyTopics < ActiveRecord::Migration[5.2]
  def change
    remove_reference :suggestions, :topic, index: true
    add_column :suggestions, :topic, :string
    drop_table :topics
  end
end
