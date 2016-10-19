class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :image
      t.references :store_type, index: true, foreign_key: true
      t.references :floor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
