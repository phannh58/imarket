class CreateEdges < ActiveRecord::Migration
  def change
    create_table :edges do |t|
      t.integer :point_start_id
      t.integer :point_end_id
      t.decimal :balance

      t.timestamps null: false
    end
    add_index :edges, :point_start_id
    add_index :edges, :point_end_id
    add_index :edges, [:point_start_id, :point_end_id], unique: true
  end
end
