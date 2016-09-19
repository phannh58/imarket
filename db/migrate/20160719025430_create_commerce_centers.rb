class CreateCommerceCenters < ActiveRecord::Migration
  def change
    create_table :commerce_centers do |t|
      t.string :name
      t.string :image
      t.references :district, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
