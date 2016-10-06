class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :product_code
      t.integer :quantity
      t.decimal :price, default: 0.0
      t.integer :sale_off, default: 0
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
