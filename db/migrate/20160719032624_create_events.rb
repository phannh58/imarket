class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :content
      t.datetime :start_event
      t.integer :event_type
      t.datetime :finish_event
      t.references :store, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
