class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.string :present_icon
      t.decimal :price, default: 0.0
      t.integer :promotion_percent, default: 0
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
