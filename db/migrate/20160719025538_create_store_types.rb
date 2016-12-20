class CreateStoreTypes < ActiveRecord::Migration
  def change
    create_table :store_types do |t|
      t.string :name
      t.string :image
      t.string :current_location_image
      t.references :commerce_center, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
