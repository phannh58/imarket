class CreateCommerceCenters < ActiveRecord::Migration
  def change
    create_table :commerce_centers do |t|
      t.string :name
      t.string :image
      t.string :address
      t.decimal :latitude, precision: 10, scale: 6, defaul: 0.0
      t.decimal :longtitude, precision: 10, scale: 6, defaul: 0.0
      t.references :district, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
