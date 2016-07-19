class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longtitude, precision: 10, scale: 6
      t.string :store_code
      t.references :store_type, index: true, foreign_key: true
      t.references :commerce_center, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
