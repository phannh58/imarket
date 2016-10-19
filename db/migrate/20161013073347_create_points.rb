class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :point_type
      t.string :name
      t.decimal :latitude, precision: 10, scale: 6, defaul: 0.0
      t.decimal :longtitude, precision: 10, scale: 6, defaul: 0.0
      t.references :store_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
