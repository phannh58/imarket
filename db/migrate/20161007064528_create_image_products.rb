class CreateImageProducts < ActiveRecord::Migration
  def change
    create_table :image_products do |t|
      t.string :name
      t.string :photo
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
